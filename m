Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EAF34ABDA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:51:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6RKC0Rjrz3c8p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 02:51:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=p5amyNRl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=arnaldo.melo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p5amyNRl; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6RJm12zbz3bv7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 02:50:47 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id g24so4538381qts.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=IE/p6g9B2j41zhqUWurLlnl/wvSKINeBITFu3XthIDw=;
 b=p5amyNRlPFbdvX8+G8rZZpCWz1eiLsPmRgfnfnuQrsvAuomUOUCem+Us27BVYWoOpJ
 +WX8mcl2uZSZjfJ7B4UWT6BtwcH/j+ShhXBZqu5mfieu/O16ijwKGhNBhhrQ85YdwCaD
 0lO9DkSlMZpGqhi3y4p6xaYaOysE3lYrveyH98PidrLDRmJxMQO2mW4pWW54oCI4jhP+
 CBbDDOuMSa/8NjnnkduMNkJ46pHE0vl/qALswUKogyzqw7mBR1Rk2NAW/WOkpydg8oUP
 wlIpSKsOHbfhNKRvtZFa1kHhOvhKZinI9jC3mCyNg2/iXhzHOwMYZA8LCV10TwfFA6lx
 3K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=IE/p6g9B2j41zhqUWurLlnl/wvSKINeBITFu3XthIDw=;
 b=flOnAlbXz3C7Wxd/cando3hHdhi9DEZttRsp1BP5nl1h2sBEfYFWFNh9l/0uR6lOis
 FQw/WEffnkRb6k5FQ8PAsc5Oq0lFp55lSM5IozdExRSzJZ3fOMk7Mn1KC8acLqfEm2tE
 6HEyos9V07Fsj7OaMp2kLAR+xSMulh3cYu/YxL0zyWS3yZ2xHMCzyxANc9WCJdB8tTT+
 11xt3bi//NXFEgGYNlK7RjYPUenuFMftYvA2OAPAG9/YRTuaxuu2Ua2QBzezrfqCYvLh
 sCMvy34KCQudSCoRLNcQH2fiW/XvtNanK14PWJYCccTO5IJl0/mOAZIkIUsPBwC1h6+k
 zGHA==
X-Gm-Message-State: AOAM532TjgscHa1JhlVD5cAZJoG5Pu5gi3OrHoh8unYtlEh5xl15N+rl
 /Se+0JPYs+8MUUFQ9+tGSXk=
X-Google-Smtp-Source: ABdhPJwK+yJ7RtkvcmD0Kxv252vfc+rSR03GCh3POtfxdO6K/hLy2U8/ed9WOmaS2BxvtUGloaqiag==
X-Received: by 2002:ac8:4a18:: with SMTP id x24mr12675962qtq.33.1616773843573; 
 Fri, 26 Mar 2021 08:50:43 -0700 (PDT)
Received: from [192.168.86.185] ([179.97.37.151])
 by smtp.gmail.com with ESMTPSA id a207sm6968906qkc.135.2021.03.26.08.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 08:50:43 -0700 (PDT)
Date: Fri, 26 Mar 2021 12:50:15 -0300
User-Agent: K-9 Mail for Android
In-Reply-To: <80EE46ED-9007-4CB7-9A52-A7A2ADC616C6@linux.vnet.ibm.com>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1616425047-1666-4-git-send-email-atrajeev@linux.vnet.ibm.com>
 <YFuWb3S8p0ZGjmGu@krava>
 <80EE46ED-9007-4CB7-9A52-A7A2ADC616C6@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 3/5] tools/perf: Add powerpc support for
 PERF_SAMPLE_WEIGHT_STRUCT
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,Jiri Olsa <jolsa@redhat.com>
From: Arnaldo <arnaldo.melo@gmail.com>
Message-ID: <F5813758-37E5-404D-BBC2-49F5BE6101C7@gmail.com>
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
Cc: ravi.bangoria@linux.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>,
 peterz@infradead.org, linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On March 26, 2021 12:23:04 PM GMT-03:00, Athira Rajeev <atrajeev@linux=2Ev=
net=2Eibm=2Ecom> wrote:
>
>
>On 25-Mar-2021, at 1:13 AM, Jiri Olsa <jolsa@redhat=2Ecom> wrote:
>
>On Mon, Mar 22, 2021 at 10:57:25AM -0400, Athira Rajeev wrote:
>
>Add arch specific arch_evsel__set_sample_weight() to set the new
>sample type for powerpc=2E
>
>Add arch specific arch_perf_parse_sample_weight() to store the
>sample->weight values depending on the sample type applied=2E
>if the new sample type (PERF_SAMPLE_WEIGHT_STRUCT) is applied,
>store only the lower 32 bits to sample->weight=2E If sample type
>is 'PERF_SAMPLE_WEIGHT', store the full 64-bit to sample->weight=2E
>
>Signed-off-by: Athira Rajeev <atrajeev@linux=2Evnet=2Eibm=2Ecom>
>---
>tools/perf/arch/powerpc/util/Build   |  2 ++
>tools/perf/arch/powerpc/util/event=2Ec | 32
>++++++++++++++++++++++++++++++++
>tools/perf/arch/powerpc/util/evsel=2Ec |  8 ++++++++
>3 files changed, 42 insertions(+)
>create mode 100644 tools/perf/arch/powerpc/util/event=2Ec
>create mode 100644 tools/perf/arch/powerpc/util/evsel=2Ec
>
>diff --git a/tools/perf/arch/powerpc/util/Build
>b/tools/perf/arch/powerpc/util/Build
>index b7945e5a543b=2E=2E8a79c4126e5b 100644
>--- a/tools/perf/arch/powerpc/util/Build
>+++ b/tools/perf/arch/powerpc/util/Build
>@@ -4,6 +4,8 @@ perf-y +=3D kvm-stat=2Eo
>perf-y +=3D perf_regs=2Eo
>perf-y +=3D mem-events=2Eo
>perf-y +=3D sym-handling=2Eo
>+perf-y +=3D evsel=2Eo
>+perf-y +=3D event=2Eo
>
>perf-$(CONFIG_DWARF) +=3D dwarf-regs=2Eo
>perf-$(CONFIG_DWARF) +=3D skip-callchain-idx=2Eo
>diff --git a/tools/perf/arch/powerpc/util/event=2Ec
>b/tools/perf/arch/powerpc/util/event=2Ec
>new file mode 100644
>index 000000000000=2E=2Ef49d32c2c8ae
>--- /dev/null
>+++ b/tools/perf/arch/powerpc/util/event=2Ec
>@@ -0,0 +1,32 @@
>+// SPDX-License-Identifier: GPL-2=2E0
>+#include <linux/types=2Eh>
>+#include <linux/string=2Eh>
>+#include <linux/zalloc=2Eh>
>+
>+#include "=2E=2E/=2E=2E/=2E=2E/util/event=2Eh"
>+#include "=2E=2E/=2E=2E/=2E=2E/util/synthetic-events=2Eh"
>+#include "=2E=2E/=2E=2E/=2E=2E/util/machine=2Eh"
>+#include "=2E=2E/=2E=2E/=2E=2E/util/tool=2Eh"
>+#include "=2E=2E/=2E=2E/=2E=2E/util/map=2Eh"
>+#include "=2E=2E/=2E=2E/=2E=2E/util/debug=2Eh"
>
>
>nit, just #include "utils/=2E=2E=2Eh" should work no?
>
>other than that, the patchset looks ok to me
>
>Acked-by: Jiri Olsa <jolsa@redhat=2Ecom>
>
>
>
>Hi Jiri, Arnaldo
>
>Thanks for reviewing the patch set=2E
>I checked that, just using "utils/=2E=2E=2Eh" also works=2E
>Below is the change which I verified=2E Since the patches are presently
>merged in=20
>https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/acme/linux=2Egit/log/=
?h=3Dtmp=2Eperf/core,
>
>can you please suggest how can we go about this change ?

I'll fix it up here,

Thanks for the patch=2E

- Arnaldo

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
