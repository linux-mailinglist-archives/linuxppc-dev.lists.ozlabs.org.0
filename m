Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E431614215
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2019 21:20:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44xwgN6HZyzDqJs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 05:20:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44xwf628GDzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 05:19:10 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id EACB82864E
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 May 2019 19:19:07 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id C289A2865F; Sun,  5 May 2019 19:19:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203515] [crypto] alg: skcipher: p8_aes_ctr encryption test
 failed (wrong result) on test vector 3, cfg="uneven misaligned splits, may
 sleep"
Date: Sun, 05 May 2019 19:19:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-203515-206035-IJDpu7ZL6G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203515-206035@https.bugzilla.kernel.org/>
References: <bug-203515-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D203515

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 282623
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D282623&action=3Dedit
bisect.log

git-bisect found 4e7babba30d820c4195b1d58cf51dce3c22ecf2b as the 1st bad
commit:

# git bisect good | tee -a ~/bisect01.log
4e7babba30d820c4195b1d58cf51dce3c22ecf2b is the first bad commit
commit 4e7babba30d820c4195b1d58cf51dce3c22ecf2b
Author: Eric Biggers <ebiggers@google.com>
Date:   Thu Jan 31 23:51:46 2019 -0800

    crypto: testmgr - convert skcipher testing to use testvec_configs

    Convert alg_test_skcipher() to use the new test framework, adding a list
    of testvec_configs to test by default.  When the extra self-tests are
    enabled, randomly generated testvec_configs are tested as well.

    This improves skcipher test coverage mainly because now all algorithms
    have a variety of data layouts tested, whereas before each algorithm was
    responsible for declaring its own chunked test cases which were often
    missing or provided poor test coverage.  The new code also tests both
    the MAY_SLEEP and !MAY_SLEEP cases, different IV alignments, and buffers
    that cross pages.

    This has already found a bug in the arm64 ctr-aes-neonbs algorithm.
    It would have easily found many past bugs.

    I removed the skcipher chunked test vectors that were the same as
    non-chunked ones, but left the ones that were unique.

    Signed-off-by: Eric Biggers <ebiggers@google.com>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

:040000 040000 c533a4dce0d9954923cd56a69e0d26eeee5324a3
c199b3af7a05160aede1522c4860abae5fbe2716 M      crypto

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
