Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208D29988C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 22:09:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKnWn5zjCzDqDs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 08:09:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=tbogendoerfer@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKklh4gfTzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 06:04:12 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8A94AE2B;
 Mon, 26 Oct 2020 19:04:08 +0000 (UTC)
Date: Mon, 26 Oct 2020 20:04:07 +0100
From: Thomas Bogendoerfer <tbogendoerfer@suse.de>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] ibmveth: Fix use of ibmveth in a bridge.
Message-Id: <20201026200407.fcf43678ba4cef7fe0cb7c98@suse.de>
In-Reply-To: <20201026115237.21b114fe@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
References: <20201026104221.26570-1-msuchanek@suse.de>
 <20201026115237.21b114fe@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 27 Oct 2020 08:07:47 +1100
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
Cc: Cristobal Forno <cforno12@linux.ibm.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Cris Forno <cforno12@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Oct 2020 11:52:37 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon, 26 Oct 2020 11:42:21 +0100 Michal Suchanek wrote:
> > From: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> >=20
> > The check for src mac address in ibmveth_is_packet_unsupported is wrong.
> > Commit 6f2275433a2f wanted to shut down messages for loopback packets,
> > but now suppresses bridged frames, which are accepted by the hypervisor
> > otherwise bridging won't work at all.
> >=20
> > Fixes: 6f2275433a2f ("ibmveth: Detect unsupported packets before sendin=
g to the hypervisor")
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>=20
> Since the From: line says Thomas we need a signoff from him.

you can add

Signed-off-by: tbogendoerfer@suse.de

Thomas.

--=20
SUSE Software Solutions Germany GmbH
HRB 36809 (AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
