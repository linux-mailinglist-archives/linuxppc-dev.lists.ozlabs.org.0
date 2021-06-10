Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2743A26E6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 10:24:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0xpv5PYYz3bsg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 18:24:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P2q0IrTn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P2q0IrTn; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0xpS3FYQz2yy9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 18:24:14 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id o9so19163246pgd.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dx3LD+QONQZ90XyumvQYMedCFWUAyiq58QYIKI9G5zg=;
 b=P2q0IrTnZYJcNJxgCNUHZgCPckId6L8Xpz9JvHK94UQxbHTBsvAoHdRevTah0jtZ3C
 DCZ6YmT9q2kBAB7ezTldLlg1d+TpPCX4gGqUxhneVHoJ49Uc/el/KNIL60EsASs+ZlNC
 JEDN6py3rNeV5OcXFDOtSDN0tP/JK+MbjrpCq1S4hdgRmboCcjRNphTQdxRzsuiHmmb5
 yfyQl++2mNNsb7k2L/BGPE9wUTxeN1Nskrt0HKrJjII+LfLXiGwuZz6Vu3TTHIMFcgAB
 Wmy5LLcTK/ZMpMXPY4uhxUvBaF/ddyPrNPoR0AcOk9q9cdPYIl8Yze1Zad+LaPa2WcsZ
 4aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dx3LD+QONQZ90XyumvQYMedCFWUAyiq58QYIKI9G5zg=;
 b=i6oiTIrO2bEPfz5HLVBCPgciSlpBiSvolKIsAaEoYBJb4fH+tAeRoiLrxstgYyCLe0
 iZzQHo/6vAkRnZo40gMhKXDfBmflASaUDbjPNaBW1kjo/OC85CJ2p9ut7QWK1+CK1tBU
 PC60B1hTScJtnTYrHErWLEEzLCu4sUXUSDArIsuIQGrxQ4BZoCw72j0uZYa79sOBXCoq
 k0kRpbnQbRSePQVCFklYB523cIaBP2l3W1CzXfOeq8zIbDvqGXsFiiCF/wU38ssPaetz
 P54I8q6Vq9AmD3/rvCy/eUAl8n4jb1GwKFzfcLOB63u9Bv6JGDVidh/Zsu/noLQI+un/
 GamA==
X-Gm-Message-State: AOAM532zU3ElYM1t/jTRG7V4RCFhkC9w7EYEcx4GFBb1/Yh/jbqqMgtN
 LwpdfYAeZ76tcu10hndZHMz1VQ==
X-Google-Smtp-Source: ABdhPJyi+O4KwGPfvZR518NR4+exaoYeuUIiRL46B3bKaN8ChQ5bmYUKDSfTaz+qd2RgLjB3qxti9A==
X-Received: by 2002:aa7:8888:0:b029:2ec:763f:4bcc with SMTP id
 z8-20020aa788880000b02902ec763f4bccmr1846743pfe.35.1623313448946; 
 Thu, 10 Jun 2021 01:24:08 -0700 (PDT)
Received: from localhost ([136.185.169.128])
 by smtp.gmail.com with ESMTPSA id h7sm1739207pfe.62.2021.06.10.01.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 01:24:08 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Qian Cai <quic_qiancai@quicinc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 0/5] cpufreq: cppc: Fix suspend/resume specific races with FIE
 code
Date: Thu, 10 Jun 2021 13:53:56 +0530
Message-Id: <cover.1623313323.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-doc@vger.kernel.org,
 Dirk Brandewie <dirk.j.brandewie@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ionela Voinescu <ionela.voinescu@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Qian,

It would be helpful if you can test this patchset and confirm if the races you
mentioned went away or not and that the FIE code works as we wanted it to.

I don't have a real setup and so it won't be easy for me to test this out.

I have already sent a temporary fix for 5.13 and this patchset is targeted for
5.14 and is based over that.

-------------------------8<-------------------------

The CPPC driver currently stops the frequency invariance related
kthread_work and irq_work from cppc_freq_invariance_exit() which is only
called during driver's removal.

This is not sufficient as the CPUs can get hot-plugged out while the
driver is in use, the same also happens during system suspend/resume.

In such a cases we can reach a state where the CPU is removed by the
kernel but its kthread_work or irq_work aren't stopped.

Fix this by implementing the start_cpu() and stop_cpu() callbacks in the
cpufreq core, which will be called for each CPU's addition/removal.

A similar call was already available in the cpufreq core, which isn't required
anymore and so its users are migrated to use exit() callback instead.

This is targeted for v5.14-rc1.

--
Viresh

Viresh Kumar (5):
  cpufreq: cppc: Migrate to ->exit() callback instead of ->stop_cpu()
  cpufreq: intel_pstate: Migrate to ->exit() callback instead of
    ->stop_cpu()
  cpufreq: powerenv: Migrate to ->exit() callback instead of
    ->stop_cpu()
  cpufreq: Add start_cpu() and stop_cpu() callbacks
  cpufreq: cppc: Fix suspend/resume specific races with the FIE code

 Documentation/cpu-freq/cpu-drivers.rst |   7 +-
 drivers/cpufreq/Kconfig.arm            |   1 -
 drivers/cpufreq/cppc_cpufreq.c         | 163 ++++++++++++++-----------
 drivers/cpufreq/cpufreq.c              |  11 +-
 drivers/cpufreq/intel_pstate.c         |   9 +-
 drivers/cpufreq/powernv-cpufreq.c      |  23 ++--
 include/linux/cpufreq.h                |   5 +-
 7 files changed, 119 insertions(+), 100 deletions(-)

-- 
2.31.1.272.g89b43f80a514

