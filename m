Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C55BA1BE75F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 21:29:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C7r04qC6zDrC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 05:29:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=jay.vosburgh@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C6j51nM3zDr8H
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 04:38:31 +1000 (AEST)
Received: from 1.general.jvosburgh.us.vpn ([10.172.68.206]
 helo=famine.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jay.vosburgh@canonical.com>)
 id 1jTrbF-0002IP-03; Wed, 29 Apr 2020 18:38:25 +0000
Received: by famine.localdomain (Postfix, from userid 1000)
 id 35163630E4; Wed, 29 Apr 2020 11:38:23 -0700 (PDT)
Received: from famine (localhost [127.0.0.1])
 by famine.localdomain (Postfix) with ESMTP id 2DA31AC1DB;
 Wed, 29 Apr 2020 11:38:23 -0700 (PDT)
From: Jay Vosburgh <jay.vosburgh@canonical.com>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH] net/bonding: Do not transition down slave after
 speed/duplex check
In-reply-to: <1588183759-7659-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1588183759-7659-1-git-send-email-tlfalcon@linux.ibm.com>
Comments: In-reply-to Thomas Falcon <tlfalcon@linux.ibm.com>
 message dated "Wed, 29 Apr 2020 13:09:19 -0500."
X-Mailer: MH-E 8.6+git; nmh 1.6; GNU Emacs 27.0.50
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29483.1588185503.1@famine>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2020 11:38:23 -0700
Message-ID: <29484.1588185503@famine>
X-Mailman-Approved-At: Thu, 30 Apr 2020 05:24:34 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: netdev@vger.kernel.org, Veaceslav Falico <vfalico@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Andy Gospodarek <andy@greyhouse.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Falcon <tlfalcon@linux.ibm.com> wrote:

>The following behavior has been observed when testing logical partition
>migration of LACP-bonded VNIC devices in a PowerVM pseries environment.
>
>1. When performing the migration, the bond master detects that a slave ha=
s
>   lost its link, deactivates the LACP port, and sets the port's
>   is_enabled flag to false.
>2. The slave device then updates it's carrier state to off while it reset=
s
>   itself. This update triggers a NETDEV_CHANGE notification, which perfo=
rms
>   a speed and duplex update. The device does not return a valid speed
>   and duplex, so the master sets the slave link state to BOND_LINK_FAIL.
>3. When the slave VNIC device(s) are active again, some operations, such
>   as setting the port's is_enabled flag, are not performed when transiti=
oning
>   the link state back to BOND_LINK_UP from BOND_LINK_FAIL, though the st=
ate
>   prior to the speed check was BOND_LINK_DOWN.

	Just to make sure I'm understanding correctly, in regards to
"the state prior to the speed check was BOND_LINK_DOWN," do you mean
that during step 1, the slave link is set to BOND_LINK_DOWN, and then in
step 2 changed from _DOWN to _FAIL?

>Affected devices are therefore not utilized in the aggregation though the=
y
>are operational. The simplest way to fix this seems to be to restrict the
>link state change to devices that are currently up and running.

	This sounds similar to an issue from last fall; can you confirm
that you're running with a kernel that includes:

1899bb325149 bonding: fix state transition issue in link monitoring

	-J
	=


>CC: Jay Vosburgh <j.vosburgh@gmail.com>
>CC: Veaceslav Falico <vfalico@gmail.com>
>CC: Andy Gospodarek <andy@greyhouse.net>
>Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
>---
> drivers/net/bonding/bond_main.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_m=
ain.c
>index 2e70e43c5df5..d840da7cd379 100644
>--- a/drivers/net/bonding/bond_main.c
>+++ b/drivers/net/bonding/bond_main.c
>@@ -3175,7 +3175,8 @@ static int bond_slave_netdev_event(unsigned long ev=
ent,
> 		 * speeds/duplex are available.
> 		 */
> 		if (bond_update_speed_duplex(slave) &&
>-		    BOND_MODE(bond) =3D=3D BOND_MODE_8023AD) {
>+		    BOND_MODE(bond) =3D=3D BOND_MODE_8023AD &&
>+		    slave->link =3D=3D BOND_LINK_UP) {
> 			if (slave->last_link_up)
> 				slave->link =3D BOND_LINK_FAIL;
> 			else
>-- =

>2.18.2
>

---
	-Jay Vosburgh, jay.vosburgh@canonical.com
