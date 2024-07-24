Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53A93B908
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 00:12:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CYIjaQjG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CYIjaQjG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTpCZ3Tlnz3d3g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 08:12:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CYIjaQjG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CYIjaQjG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rysulliv@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTjMT2X8Kz3bvP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2024 04:33:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721846015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MVEdeoQVSsbfd8EdbBodE9oloSS0jVMwnbQWLcufTxQ=;
	b=CYIjaQjGmzfj0+FtprzuhVIO12azZQoGNwPrmBQe9mBmcAb2PkjVbDrQGNPyL+p69B7e10
	Llzl2eGqrr+E97HW6AN8CyZmgqZK7snfSsMcndEZjZFb8d0nu+whesZCwNOvEKegb5jdPl
	mCC+9tb+wmJQ6wxkVHmQGhWdCYHoXxs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721846015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MVEdeoQVSsbfd8EdbBodE9oloSS0jVMwnbQWLcufTxQ=;
	b=CYIjaQjGmzfj0+FtprzuhVIO12azZQoGNwPrmBQe9mBmcAb2PkjVbDrQGNPyL+p69B7e10
	Llzl2eGqrr+E97HW6AN8CyZmgqZK7snfSsMcndEZjZFb8d0nu+whesZCwNOvEKegb5jdPl
	mCC+9tb+wmJQ6wxkVHmQGhWdCYHoXxs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-vpbCjpWoNgCUjm50ebDRrA-1; Wed,
 24 Jul 2024 14:33:34 -0400
X-MC-Unique: vpbCjpWoNgCUjm50ebDRrA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2659E1955F43;
	Wed, 24 Jul 2024 18:33:31 +0000 (UTC)
Received: from sullivan-work.redhat.com (unknown [10.22.64.141])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC35919560AE;
	Wed, 24 Jul 2024 18:33:27 +0000 (UTC)
From: Ryan Sullivan <rysulliv@redhat.com>
To: live-patching@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/ftrace: restore r2 to caller's stack on livepatch sibling call
Date: Wed, 24 Jul 2024 14:33:21 -0400
Message-ID: <20240724183321.9195-1-rysulliv@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mailman-Approved-At: Thu, 25 Jul 2024 08:10:17 +1000
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
Cc: pmladek@suse.com, joe.lawrence@redhat.com, jikos@kernel.org, christophe.leroy@csgroup.eu, rysulliv@redhat.com, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, mbenes@suse.cz, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, on PowerPC machines, sibling calls in livepatched functions
cause the stack to be corrupted and are thus not supported by tools
such as kpatch. Below is an example stack frame showing one such
currupted stacks:

RHEL-7.6: Linux 3.10.0 ppc64le

Livepatch applied:

diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index e008aefc3a9d..7c70e369390d 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2228,6 +2228,8 @@ static void xs_tcp_shutdown(struct rpc_xprt *xprt)
 	struct socket *sock = transport->sock;
 	int skst = transport->inet ? transport->inet->sk_state : TCP_CLOSE;

+	asm("nop");
+
 	if (sock == NULL)
 		return;
 	switch (skst) {

Context:

- The livepatch updates both xs_tcp_shutdown() and xs_reset_transport()
in the sunrpc module. This causes the compiler to generate a tail call
optimization for the patched instance of xs_tcp_shutdown() ->
xs_reset_transport()

Stack Frame:

 #4 [c000002fe4be7c00] __rpc_create_common at d000000026e118f4 [sunrpc]
    c000002fe4be7c00: c000002fe4be7c40 0000000000000000
    c000002fe4be7c10: c00000000000b054 d000000026fda3d8 < corrupted toc
    c000002fe4be7c20: c00000000626cf00 c000002fe1a5f100
    c000002fe4be7c30: c000003c79cbec48 c000003c79cbec50
 #5 [c000002fe4be7c40] process_one_work at c00000000012333c
    c000002fe4be7c40: c000002fe4be7ce0 c000000006260a00
    c000002fe4be7c50: c00000000012333c c0000000013e4d00 < correct toc
    c000002fe4be7c60: 0000000000000000 0000000000000000
    c000002fe4be7c70: 0000000000000000 0000000000000000
    c000002fe4be7c80: c000002fe4be7ce0 c0000000013510b0
    c000002fe4be7c90: 0000000000000001 fffffffffffffef7
    c000002fe4be7ca0: 0000000000000000 c000000006260980
    c000002fe4be7cb0: c000002fe1a5f130 c000000001422280
    c000002fe4be7cc0: c000000006260620 c000003c79cbec48
    c000002fe4be7cd0: c000000006260600 c000002fe1a5f100
 #6 [c000002fe4be7ce0] worker_thread at c000000000123980
    c000002fe4be7ce0: c000002fe4be7d80 0000000000003300
    c000002fe4be7cf0: c000000000123980 c000002fe8c8bb40
    c000002fe4be7d00: 0000000000000000 0000000000000000
    c000002fe4be7d10: 0000000000000000 0000000000000000
    c000002fe4be7d20: 0000000000000000 0000000000000000
    c000002fe4be7d30: 0000000000000000 0000000000000000
    c000002fe4be7d40: 0000000000000000 0000000000000000
    c000002fe4be7d50: c0000000001237e0 c000002fe1a5f100
    c000002fe4be7d60: c000000000c894a0 c0000000016be410
    c000002fe4be7d70: 0000000000000000 c000002fe8c8bb40

This is caused by the toc stub generated on a sibling call:

0xd000000026fd0ad0 <xs_tcp_shutdown+816>:       addis   r11,r2,-1
0xd000000026fd0ad4 <xs_tcp_shutdown+820>:       addi    r11,r11,26360
0xd000000026fd0ad8 <xs_tcp_shutdown+824>:       std     r2,24(r1)
                                                ^ corrupts stack frame
0xd000000026fd0adc <xs_tcp_shutdown+828>:       ld      r12,32(r11)
0xd000000026fd0ae0 <xs_tcp_shutdown+832>:       mtctr   r12
0xd000000026fd0ae4 <xs_tcp_shutdown+836>:       bctr

This ends up saving the livepatch toc to the caller's stack located in
the sunrpc module so that since the stack is not popped, once the
caller attempts to use the toc, a kernel panic results from being
unable to handle the kernel paging request for data at that location
outside the caller's module.

This patch restores r2 value to caller's stack, on a sibling call this
will uncorrupt the caller's stack and otherwise will be redundant.

Signed-off-by: Ryan Sullivan <rysulliv@redhat.com>
---
 arch/powerpc/kernel/trace/ftrace_entry.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 76dbe9fd2c0f..4dfbe6076ad1 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -244,6 +244,9 @@ livepatch_handler:
 	mtlr	r12
 	ld	r2,  -24(r11)
 
+	/* Restore toc to caller's stack in case of sibling call */
+	std	r2, 24(r1)
+
 	/* Pop livepatch stack frame */
 	ld	r12, PACA_THREAD_INFO(r13)
 	subi	r11, r11, 24
-- 
2.44.0

