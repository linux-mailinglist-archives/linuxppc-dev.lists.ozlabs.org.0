Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE0428F5B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 17:22:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBtM339dTzDqGY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 02:22:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.69;
 helo=se14-2.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
X-Greylist: delayed 1286 seconds by postgrey-1.36 at bilbo;
 Fri, 16 Oct 2020 02:20:26 AEDT
Received: from se14-2.privateemail.com (se14-2.privateemail.com
 [198.54.127.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBtJV0D8JzDqF3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 02:20:25 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se14.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>) id 1kT4iT-0005PL-Nz
 for linuxppc-dev@lists.ozlabs.org; Thu, 15 Oct 2020 07:59:01 -0700
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id B02B1A6F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:52 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 9350580046
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 10:58:52 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.235])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 6541A80041
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:52 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/8] Improve signal performance on PPC64 with KUAP
Date: Thu, 15 Oct 2020 10:01:51 -0500
Message-Id: <20201015150159.28933-1-cmr@codefail.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.05)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0ZXzIHSbE2lF8iY6Od2jmSypSDasLI4SayDByyq9LIhViSvBvoGA1PKw
 0/ADnCN/+ETNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX7tsjNGt6ga+gOd82cI5iPfFO05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgix6Fhd62KY0TvtygpLSFJ3Lw5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipWZHuZ2luxkemtGoNxZUQqTo/wKPvFA5qTwvBasVtSz0gfFrL3927nPLXidUYhzT
 L3iFCDAL0QosIifn4ScHG4ifU642KNtk4n/u8nyV2xsjehIqUczFWeS6sE8e1b5/Uj/i4hYVfUxI
 FxiN15g3w5xXw7ICF89SRx911u2+L1VDWTXxQxalx1UzmAX+Mm3XrPEJxD5mbm+QYi3GBj11aazW
 78ZTQ7i5CZLcqOLpLJxz1m+Kp1KCPGoyG38yARaHof3QzxUBjDlIxq/CY6GWA8+LBDMrD7q/cJog
 wbqzsuoky0Qu9o0UsJYe8KzUZOzYBJq7nLN6wi0+LTtGPl8kCiqRsjtBYSmMAZnDo+4asne4/G1I
 l1bfb2jzXa+qJgNxdnLYM3A6BXfvel8OEFDbU52Uoxy7ZVs22aLE5aXKh2Z2/SyswYYxeanpYW+O
 DenQmhIuIkxkuoNHoZV8ALzej/7m/TG6mPfH0STtFp8lq4mlVm2lHuINJIGiJ73RKeuKpUVINNG3
 OVUHjoaAVY6FvR05Ix7/C9VwqPH/5QpQnZ0BJh1tDfjT4hz4J/ncsYb09chmWIDGRew9XvW9QFDz
 YgSG3lyuFjEDwoOBw76gv6dU
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
avoiding the repeated uaccess switches. The third patch adds 'notrace'
to any functions expected to be called in a uaccess block context.
Normally functions called in such a context should be inlined, but this
is not feasible everywhere. Marking them 'notrace' should provide _some_
protection against leaving the user access window open.

The next three patches rewrite some of the signal64 helper functions to
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

Christopher M. Riedl (5):
  powerpc/uaccess: Add unsafe_copy_from_user
  powerpc/signal: Add unsafe_copy_{vsx,fpr}_from_user()
  powerpc: Mark functions called inside uaccess blocks w/ 'notrace'
  powerpc/signal64: Replace setup_sigcontext() w/
    unsafe_setup_sigcontext()
  powerpc/signal64: Replace restore_sigcontext() w/
    unsafe_restore_sigcontext()

Daniel Axtens (3):
  powerpc/signal64: Replace setup_trampoline() w/
    unsafe_setup_trampoline()
  powerpc/signal64: Rewrite handle_rt_signal64() to minimise uaccess
    switches
  powerpc/signal64: Rewrite rt_sigreturn() to minimise uaccess switches

 arch/powerpc/include/asm/uaccess.h |  28 ++--
 arch/powerpc/kernel/process.c      |  20 +--
 arch/powerpc/kernel/signal.h       |  33 +++++
 arch/powerpc/kernel/signal_64.c    | 216 +++++++++++++++++------------
 arch/powerpc/mm/mem.c              |   4 +-
 5 files changed, 194 insertions(+), 107 deletions(-)

-- 
2.28.0

