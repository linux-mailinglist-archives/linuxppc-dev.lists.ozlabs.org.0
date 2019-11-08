Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769AF5254
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 18:11:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478myX5c94zF7j2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 04:11:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y1F+rsQQ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478mdb5358zF7fF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 03:56:51 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F297C20674;
 Fri,  8 Nov 2019 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573232209;
 bh=a3DUxxJiBMqtBRPcGnHGNjHfp2WmZOui6EDma7/sKgM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=Y1F+rsQQ6F1L+698tgsjfEauyJTCSeQR61Ozw98wO5F+5brfKjhS6nc9LSVNITfdZ
 O8XwqhaC2dCZq8ibgUEZFLIRI1SwVu/Ulh6urQq0apThJjvPSnR//mxWWDuQ0IwG/G
 Rmk0F/dr+XJoTur5jXz3VC56B/hEUfkKVNa07cMw=
Subject: Patch "selftests/powerpc: Fix compile error on tlbie_test due to
 newer gcc" has been added to the 4.14-stable tree
To: 20191003211010.9711-1-desnesn@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 desnesn@linux.ibm.com, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, sandipan@linux.ibm.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 08 Nov 2019 17:56:25 +0100
In-Reply-To: <20191017080505.8348-6-sandipan@linux.ibm.com>
Message-ID: <157323218512214@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    selftests/powerpc: Fix compile error on tlbie_test due to newer gcc

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     selftests-powerpc-fix-compile-error-on-tlbie_test-due-to-newer-gcc.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri 08 Nov 2019 05:55:09 PM CET
From: Sandipan Das <sandipan@linux.ibm.com>
Date: Thu, 17 Oct 2019 13:35:05 +0530
Subject: selftests/powerpc: Fix compile error on tlbie_test due to newer gcc
To: gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org, aneesh.kumar@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>
Message-ID: <20191017080505.8348-6-sandipan@linux.ibm.com>

From: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>

commit 5b216ea1c40cf06eead15054c70e238c9bd4729e upstream.

Newer versions of GCC (>= 9) demand that the size of the string to be
copied must be explicitly smaller than the size of the destination.
Thus, the NULL char has to be taken into account on strncpy.

This will avoid the following compiling error:

  tlbie_test.c: In function 'main':
  tlbie_test.c:639:4: error: 'strncpy' specified bound 100 equals destination size
      strncpy(logdir, optarg, LOGDIR_NAME_SIZE);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Cc: stable@vger.kernel.org # v4.14
Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191003211010.9711-1-desnesn@linux.ibm.com
[sandipan: Backported to v4.14]
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/testing/selftests/powerpc/mm/tlbie_test.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/tools/testing/selftests/powerpc/mm/tlbie_test.c
+++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
@@ -636,7 +636,7 @@ int main(int argc, char *argv[])
 			nrthreads = strtoul(optarg, NULL, 10);
 			break;
 		case 'l':
-			strncpy(logdir, optarg, LOGDIR_NAME_SIZE);
+			strncpy(logdir, optarg, LOGDIR_NAME_SIZE - 1);
 			break;
 		case 't':
 			run_time = strtoul(optarg, NULL, 10);


Patches currently in stable-queue which might be from sandipan@linux.ibm.com are

queue-4.14/powerpc-book3s64-mm-don-t-do-tlbie-fixup-for-some-hardware-revisions.patch
queue-4.14/selftests-powerpc-add-test-case-for-tlbie-vs-mtpidr-ordering-issue.patch
queue-4.14/selftests-powerpc-fix-compile-error-on-tlbie_test-due-to-newer-gcc.patch
queue-4.14/powerpc-mm-fixup-tlbie-vs-mtpidr-mtlpidr-ordering-issue-on-power9.patch
queue-4.14/powerpc-mm-fixup-tlbie-vs-store-ordering-issue-on-power9.patch
queue-4.14/powerpc-book3s64-radix-rename-cpu_ftr_p9_tlbie_bug-feature-flag.patch
