Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0776F4302
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 13:47:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9dcN18l0z3cfB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 21:47:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Da4Q2EyB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Da4Q2EyB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9dbT28xzz3bbZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 21:47:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D4366237E
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 11:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75E46C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683028016;
	bh=zct1CKHHHxkLseDuLDQBj7ei3uiA1UIzswBinZAym80=;
	h=From:To:Subject:Date:From;
	b=Da4Q2EyBScfiOrr6UO9JHMw70NJ5Lx1s8cN0ke+dch+gfBs3uuUna40FvxE9DNL6T
	 O4OPfdk1w5Nhd2Lvq2v3TONvyz7zzNBb5ZBERLujb2JP2Sz+JWitJh+1pgWK8tHErT
	 n5piwMih5wMR3C7UfNcaoDuBAra4/GyEvf3sVXpYDmJGB0mzVHAHrOIo/+3/B7QXE0
	 8LeDdzT75mkSuI/hAdpei39rSe/wqsc3v1fknfXf9LHZeK0wNS7MVcbK4ibL572yyD
	 yoxlVbbe5sYN6KMkNHTlHt2GgoMSC2hxkYjFcRumovggLxP7OKxQlL2tiWpZZop81t
	 hfNcJ736gSjVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5835AC43141; Tue,  2 May 2023 11:46:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217390] New: use after free in spufs_switch_log_poll
Date: Tue, 02 May 2023 11:46:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: james010kim@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217390-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D217390

            Bug ID: 217390
           Summary: use after free in spufs_switch_log_poll
           Product: Platform Specific/Hardware
           Version: 2.5
          Hardware: PPC-32
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: james010kim@gmail.com
        Regression: No

When T2(poll) and T3(release) run concurrently by file_operations calls,
use-after-free happens due to the mistake of proper lock.

(ALLOC)
https://elixir.bootlin.com/linux/latest/source/arch/powerpc/platforms/cell/=
spufs/file.c#L2298
T1. open
2298 static int spufs_switch_log_open(struct inode *inode, struct file *fil=
e) {
2300    struct spu_context *ctx =3D SPUFS_I(inode)->i_ctx;
2301    int rc;
=E2=80=A6..
2312    ctx->switch_log =3D kmalloc(struct_size(ctx->switch_log, log,
2313                              SWITCH_LOG_BUFSIZE), GFP_KERNEL); //
ALLOC-site
=E2=80=A6.
2327 }

The spufs_switch_log_open malloced ctx->switch_log that globally.

T2. poll
2431 static __poll_t spufs_switch_log_poll(struct file *file, poll_table *w=
ait)
2432 {
2433    struct inode *inode =3D file_inode(file);
2434    struct spu_context *ctx =3D SPUFS_I(inode)->i_ctx;
2435    __poll_t mask =3D 0;
2436    int rc;

2438    poll_wait(file, &ctx->switch_log->wait, wait); // delayed by =E2=80=
=98wait=E2=80=99
callback
2430 // ctx->switch_log can be free by T3.=20
2440    rc =3D spu_acquire(ctx);
2441    if (rc)
2442            return rc;

2444    if (spufs_switch_log_used(ctx) > 0) // USE-site
2445            mask |=3D EPOLLIN;

2447    spu_release(ctx);

2449    return mask;
2450 }

static inline void poll_wait(struct file * filp, wait_queue_head_t *
wait_address, poll_table *p)
{
        if (p && p->_qproc && wait_address)
                p->_qproc(filp, wait_address, p);  // The callback makes de=
lays
}

T3. release
https://elixir.bootlin.com/linux/latest/source/arch/powerpc/platforms/cell/=
spufs/file.c#L2329
2329 static int spufs_switch_log_release(struct inode *inode, struct file
*file)
2330 {
2331    struct spu_context *ctx =3D SPUFS_I(inode)->i_ctx;
2332    int rc;

2334    rc =3D spu_acquire(ctx);
2335    if (rc)
2336            return rc;

2338    kfree(ctx->switch_log);   // FREE-site
2339    ctx->switch_log =3D NULL;
2340    spu_release(ctx);

2342    return 0;
2343 }


Fix could maybe be something like:

--- a/arch/powerpc/platforms/cell/spufs/file.c
+++ b/arch/powerpc/platforms/cell/spufs/file.c
*************** static __poll_t spufs_switch_log_poll(struct file *fil
*** 2435,2443 ****
        __poll_t mask =3D 0;
        int rc;

        poll_wait(file, &ctx->switch_log->wait, wait);

-       rc =3D spu_acquire(ctx);
        if (rc)
                return rc;

--- 2435,2443 ----
        __poll_t mask =3D 0;
        int rc;

+       rc =3D spu_acquire(ctx);
        poll_wait(file, &ctx->switch_log->wait, wait);

        if (rc)
                return rc;

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
