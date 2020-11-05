Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DC2A76D9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 06:19:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRWzX2wZbzDqlp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:19:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.80;
 helo=se17-1.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se17-1.privateemail.com (se17-1.privateemail.com
 [198.54.127.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRWrb4ZbFzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 16:13:35 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se17.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>) id 1kaXaS-000364-6V
 for linuxppc-dev@lists.ozlabs.org; Wed, 04 Nov 2020 21:13:33 -0800
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 833AAA71
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:27 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 665FF80046
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 00:13:27 -0500 (EST)
Received: from geist.attlocal.net (unknown [10.20.151.249])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 3250F80041
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:27 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/8] Improve signal performance on PPC64 with KUAP
Date: Wed,  4 Nov 2020 23:16:53 -0600
Message-Id: <20201105051701.25053-1-cmr@codefail.de>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00612076262547)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0XvADx2zSFwG+3csxFBPBHmpSDasLI4SayDByyq9LIhVyd9s+X+sNCIv
 BesJIN23D0TNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX7uq/9Nm+V1W2SDG//IYX4H1O05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgiwgDRmu5tQENuqerHYiwxW7w5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipUHvm3Pq/TMVhLiLVSlbDnIEsVH1HkXSWW+lJituJnqw31/E3ahF5MMcDI7KdpjQ
 KUg2DwcIutxTdYYuCv7MB8w4iSij0rwbBa82X4V+KdE8ybxQmwA+8NxVIq0MJiSKg9jlDHh8k6TT
 dHl8m1/8O/92QjNLubgZSlcJjVjePeKVE0yhWxRviTEhnM4stux5zs2eyc346LIB3Zm3bJBgM0nW
 nv2O+GUciRvT7igjbfErOUrdY4KOjGdsYcfekLwb/mZJgVZw2KizLfHKT1Ui9eqnil7sNNnzdI7c
 WFzHzXcM92PNDpgLsd6Ddd/s7VM53ngEDB0hGM25vwdLItd8JHlwRg+9bWPA7CG7LJO22QfGpvIQ
 LT5rkrG+KrR4dVWHxjGCbeepW71B/nrN4oZAQtBc9aUV1oY4fX3W5eOCNA39ksRRE30nnfZObe7o
 1mbr5b4m4O41f3i6XB3J2CA/ZpSpytsBXZZv0niRRFlqwL4JNTd9Km+1fuQNFP4CpCvZPbNBqyph
 zXy+6cTE/AxalG8BEiCj5vZGv9mneHqn4w6ZRYMJqVDlz3D3q3rGz4wpqbrr3vieQzASqOF9IoeU
 DZANWzkl2RGDx1/F1uE2HybNOt0p+xrrv5paups8mshKvA==
X-Report-Abuse-To: spam@se5.registrar-servers.com
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

As reported by Anton, there is a large penalty to signal handling
performance on radix systems using KUAP. The signal handling code
performs many user access operations, each of which needs to switch the
KUAP permissions bit to open and then close user access. This involves a
costly 'mtspr' operation [0].

There is existing work done on x86 and by Christopher Leroy for PPC32 to
instead open up user access in "blocks" using user_*_access_{begin,end}.
We can do the same in PPC64 to bring performance back up on KUAP-enabled
radix systems.

This series applies on top of Christophe Leroy's work for PPC32 [1] (I'm
sure patchwork won't be too happy about that).

The first two patches add some needed 'unsafe' versions of copy-from
functions. While these do not make use of asm-goto they still allow for
avoiding the repeated uaccess switches.

The third patch moves functions called by setup_sigcontext() into a new
prepare_setup_sigcontext() to simplify converting setup_sigcontext()
into an 'unsafe' version which assumes an open uaccess window later.

The fourth patch cleans-up some of the Transactional Memory ifdef stuff
to simplify using uaccess blocks later.

The next two patches rewrite some of the signal64 helper functions to
be 'unsafe'. Finally, the last two patches update the main signal
handling functions to make use of the new 'unsafe' helpers and eliminate
some additional uaccess switching.

I used the will-it-scale signal1 benchmark to measure and compare
performance [2]. The below results are from a P9 Blackbird system. Note
that currently hash does not support KUAP and is therefore used as the
"baseline" comparison. Bigger numbers are better:

	signal1_threads -t1 -s10

	|                 | hash   | radix  |
	| --------------- | ------ | ------ |
	| linuxppc/next   | 289014 | 158408 |
	| unsafe-signal64 | 298506 | 253053 |

[0]: https://github.com/linuxppc/issues/issues/277
[1]: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=196278
[2]: https://github.com/antonblanchard/will-it-scale/blob/master/tests/signal1.c

v2:	* Rebase on latest linuxppc/next + Christophe Leroy's PPC32
	  signal series
	* Simplify/remove TM ifdefery similar to PPC32 series and clean
	  up the uaccess begin/end calls
	* Isolate non-inline functions so they are not called when
	  uaccess window is open

Christopher M. Riedl (6):
  powerpc/uaccess: Add unsafe_copy_from_user
  powerpc/signal: Add unsafe_copy_{vsx,fpr}_from_user()
  powerpc/signal64: Move non-inline functions out of setup_sigcontext()
  powerpc/signal64: Remove TM ifdefery in middle of if/else block
  powerpc/signal64: Replace setup_sigcontext() w/
    unsafe_setup_sigcontext()
  powerpc/signal64: Replace restore_sigcontext() w/
    unsafe_restore_sigcontext()

Daniel Axtens (2):
  powerpc/signal64: Rewrite handle_rt_signal64() to minimise uaccess
    switches
  powerpc/signal64: Rewrite rt_sigreturn() to minimise uaccess switches

 arch/powerpc/include/asm/uaccess.h |  28 ++--
 arch/powerpc/kernel/signal.h       |  33 ++++
 arch/powerpc/kernel/signal_64.c    | 239 ++++++++++++++++++-----------
 3 files changed, 201 insertions(+), 99 deletions(-)

-- 
2.29.0

