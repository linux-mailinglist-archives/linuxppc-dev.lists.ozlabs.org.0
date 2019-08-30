Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AFCA3A2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 17:17:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KjlL1ptlzDr45
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 01:17:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Kjfq6yG6zDr1j
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 01:13:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=redhat.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Kjfq3k0wz8xPf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 01:13:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46Kjfq29nxz9sN4; Sat, 31 Aug 2019 01:13:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=dhowells@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46Kjfp5C30z9sML
 for <linuxppc-dev@ozlabs.org>; Sat, 31 Aug 2019 01:13:38 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 95434308FEC1;
 Fri, 30 Aug 2019 15:13:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47D8E60BE1;
 Fri, 30 Aug 2019 15:13:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <85B7196E-D717-4F19-A7E8-82A18287A3DE@linux.vnet.ibm.com>
References: <85B7196E-D717-4F19-A7E8-82A18287A3DE@linux.vnet.ibm.com>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: Oops (request_key_auth_describe) while running cve-2016-7042 from
 LTP
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11985.1567178014.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Aug 2019 16:13:34 +0100
Message-ID: <11986.1567178014@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 30 Aug 2019 15:13:36 +0000 (UTC)
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
Cc: dhowells@redhat.com, linuxppc-dev@ozlabs.org,
 Hillf Danton <hdanton@sina.com>, keyrings@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Can you try this patch instead of Hillf's?

David
---
commit df882ad6d4e24a3763719c1798ea58e87d56c2d7
Author: Hillf Danton <hdanton@sina.com>
Date:   Fri Aug 30 15:54:33 2019 +0100

    keys: Fix missing null pointer check in request_key_auth_describe()
    =

    If a request_key authentication token key gets revoked, there's a wind=
ow in
    which request_key_auth_describe() can see it with a NULL payload - but=
 it
    makes no check for this and something like the following oops may occu=
r:
    =

            BUG: Kernel NULL pointer dereference at 0x00000038
            Faulting instruction address: 0xc0000000004ddf30
            Oops: Kernel access of bad area, sig: 11 [#1]
            ...
            NIP [...] request_key_auth_describe+0x90/0xd0
            LR [...] request_key_auth_describe+0x54/0xd0
            Call Trace:
            [...] request_key_auth_describe+0x54/0xd0 (unreliable)
            [...] proc_keys_show+0x308/0x4c0
            [...] seq_read+0x3d0/0x540
            [...] proc_reg_read+0x90/0x110
            [...] __vfs_read+0x3c/0x70
            [...] vfs_read+0xb4/0x1b0
            [...] ksys_read+0x7c/0x130
            [...] system_call+0x5c/0x70
    =

    Fix this by checking for a NULL pointer when describing such a key.
    =

    Also make the read routine check for a NULL pointer to be on the safe =
side.
    =

    Fixes: 04c567d9313e ("[PATCH] Keys: Fix race between two instantiators=
 of a key")
    Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
    Signed-off-by: David Howells <dhowells@redhat.com>

diff --git a/security/keys/request_key_auth.c b/security/keys/request_key_=
auth.c
index e73ec040e250..ecba39c93fd9 100644
--- a/security/keys/request_key_auth.c
+++ b/security/keys/request_key_auth.c
@@ -66,6 +66,9 @@ static void request_key_auth_describe(const struct key *=
key,
 {
 	struct request_key_auth *rka =3D dereference_key_rcu(key);
 =

+	if (!rka)
+		return;
+
 	seq_puts(m, "key:");
 	seq_puts(m, key->description);
 	if (key_is_positive(key))
@@ -83,6 +86,9 @@ static long request_key_auth_read(const struct key *key,
 	size_t datalen;
 	long ret;
 =

+	if (!rka)
+		return -EKEYREVOKED;
+
 	datalen =3D rka->callout_len;
 	ret =3D datalen;
 =

