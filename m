Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A163332DEA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 19:12:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw3GS0nKNz3cLF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 05:12:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Wed, 10 Mar 2021 05:12:30 AEDT
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw3G63xHSz3cG2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 05:12:30 +1100 (AEDT)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-YbQoMtiLOkGTYLcLvRh8gA-1; Tue, 09 Mar 2021 13:11:14 -0500
X-MC-Unique: YbQoMtiLOkGTYLcLvRh8gA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F062C80364C;
 Tue,  9 Mar 2021 18:11:12 +0000 (UTC)
Received: from bahia.lan (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E053610190A7;
 Tue,  9 Mar 2021 18:11:11 +0000 (UTC)
Subject: [PATCH] powerpc/xmon: Check cpu id in commands "c#", "dp#" and "dx#"
From: Greg Kurz <groug@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Date: Tue, 09 Mar 2021 19:11:10 +0100
Message-ID: <161531347060.252863.10490063933688958044.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All these commands end up peeking into the PACA using the user originated
cpu id as an index. Check the cpu id is valid in order to prevent xmon to
crash. Instead of printing an error, this follows the same behavior as the
"lp s #" command : ignore the buggy cpu id parameter and fall back to the
#-less version of the command.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/xmon/xmon.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 80fbf8968f77..d3d6e044228e 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1248,7 +1248,7 @@ static int cpu_cmd(void)
 =09unsigned long cpu, first_cpu, last_cpu;
 =09int timeout;
=20
-=09if (!scanhex(&cpu)) {
+=09if (!scanhex(&cpu) || cpu >=3D num_possible_cpus()) {
 =09=09/* print cpus waiting or in xmon */
 =09=09printf("cpus stopped:");
 =09=09last_cpu =3D first_cpu =3D NR_CPUS;
@@ -2678,7 +2678,7 @@ static void dump_pacas(void)
=20
 =09termch =3D c;=09/* Put c back, it wasn't 'a' */
=20
-=09if (scanhex(&num))
+=09if (scanhex(&num) && num < num_possible_cpus())
 =09=09dump_one_paca(num);
 =09else
 =09=09dump_one_paca(xmon_owner);
@@ -2751,7 +2751,7 @@ static void dump_xives(void)
=20
 =09termch =3D c;=09/* Put c back, it wasn't 'a' */
=20
-=09if (scanhex(&num))
+=09if (scanhex(&num) && num < num_possible_cpus())
 =09=09dump_one_xive(num);
 =09else
 =09=09dump_one_xive(xmon_owner);


