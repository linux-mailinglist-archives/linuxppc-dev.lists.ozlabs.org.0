Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEC44BBF06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 19:07:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0fmg5dV7z3cYK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 05:07:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Tc8NRnRg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::c2e;
 helo=mail-oo1-xc2e.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Tc8NRnRg; dkim-atps=neutral
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0fm14JpSz3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 05:06:50 +1100 (AEDT)
Received: by mail-oo1-xc2e.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so4394735ooa.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 10:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j28LsEyKO8fhnvouEfWy5wWPWcngh3hdC6d0wPRNOHw=;
 b=Tc8NRnRggxrDmjg3L2ct4nrSkx07K06UkPIviAKlfLFrk2ctwl541YfpN2b5ABGjUa
 SV0RYScbzN6Zc8aMKLpBaAxWZabKT3hxdcPEcpVaTDDNvwzpXIfffQALwlnyq6akvrFl
 t2lRsZUYVLw9ZrGs7O8NABu51Rjth5d1zxUDpTg5C4OUZB5/BXk/WVeYaKw5Plhgz+b3
 8x+6AgPxBNh4D0iRXP7U8/9+S+N0OdzmPfL39gS6ki3gWldvwWXbblz6MkiUSUX+Bq+A
 3Ho+J1w0Ja0CRzoonVgBKrJi1Eakch0KYaabCiSVl8+TI3ljw3jVmhK/kycCPwu72/V3
 Yiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j28LsEyKO8fhnvouEfWy5wWPWcngh3hdC6d0wPRNOHw=;
 b=CTZ4aCQtgF/YvissZDcJZU1mlBrcvQ+WNgo0ho5xRLN1HzOwbFX2Qx2XFDZRM66hhl
 BIK6Va8AHi+GW2Sr5PFRiEDD9OzQFzqmhbj7caebMn55Ey5fSnvkszKOnh0ghtERpv+u
 JYU9zDTLFohfuPbMLNa1TSlROApVeXkFaMLY8bFL71inhW2ZN5WOVRCoIP0ROyAG4Lg/
 5tLcTDWVbshcVhb9942WiDL/9N8IWZhSwF6LgCfsZWZJa/N9bN4w0wJLL+xuyWMfMCQg
 +uI9+H1xFzHWLXQSJ47aHzOnUfnSlNwpD0Rp3nzW3pVbUSyiWxMojnjEUxb6VjTOH2Ai
 f6xA==
X-Gm-Message-State: AOAM530L6K8bhG6mRpqVOzbg3rWhFnEWEYSEUYtY+9nH9ZpM1H7/qP6Z
 wPoBikS/sYWYgVA+u1kp8GXKun4GPmpz6obA//5tYg==
X-Google-Smtp-Source: ABdhPJzXHeMUfUpHFz9cX4KAvTQ8Kr6vcAte/GQmMLl8KbpIaHiH9oO/JX/8xW2dkD2gcjeaiGq0I+RIHUNxzzDNqno=
X-Received: by 2002:a05:6871:586:b0:d2:672a:8dd with SMTP id
 u6-20020a056871058600b000d2672a08ddmr3618682oan.16.1645207607939; Fri, 18 Feb
 2022 10:06:47 -0800 (PST)
MIME-Version: 1.0
References: <20220217163357.276036-1-kjain@linux.ibm.com>
In-Reply-To: <20220217163357.276036-1-kjain@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 18 Feb 2022 10:06:36 -0800
Message-ID: <CAPcyv4jwpMbz0woftSfm3EO05pr3ZG9rVMJCkYVsapKYSOn3xw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Add perf interface to expose nvdimm
To: Kajol Jain <kjain@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Santosh Sivaraj <santosh@fossix.org>,
 maddy@linux.ibm.com, "Weiny, Ira" <ira.weiny@intel.com>,
 rnsastry@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 atrajeev@linux.vnet.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 17, 2022 at 8:34 AM Kajol Jain <kjain@linux.ibm.com> wrote:
>
> Patchset adds performance stats reporting support for nvdimm.
> Added interface includes support for pmu register/unregister
> functions. A structure is added called nvdimm_pmu to be used for
> adding arch/platform specific data such as cpumask, nvdimm device
> pointer and pmu event functions like event_init/add/read/del.
> User could use the standard perf tool to access perf events
> exposed via pmu.
>
> Interface also defines supported event list, config fields for the
> event attributes and their corresponding bit values which are exported
> via sysfs. Patch 3 exposes IBM pseries platform nmem* device
> performance stats using this interface.
>
> Result from power9 pseries lpar with 2 nvdimm device:
>
> Ex: List all event by perf list
>
> command:# perf list nmem
>
>   nmem0/cache_rh_cnt/                                [Kernel PMU event]
>   nmem0/cache_wh_cnt/                                [Kernel PMU event]
>   nmem0/cri_res_util/                                [Kernel PMU event]
>   nmem0/ctl_res_cnt/                                 [Kernel PMU event]
>   nmem0/ctl_res_tm/                                  [Kernel PMU event]
>   nmem0/fast_w_cnt/                                  [Kernel PMU event]
>   nmem0/host_l_cnt/                                  [Kernel PMU event]
>   nmem0/host_l_dur/                                  [Kernel PMU event]
>   nmem0/host_s_cnt/                                  [Kernel PMU event]
>   nmem0/host_s_dur/                                  [Kernel PMU event]
>   nmem0/med_r_cnt/                                   [Kernel PMU event]
>   nmem0/med_r_dur/                                   [Kernel PMU event]
>   nmem0/med_w_cnt/                                   [Kernel PMU event]
>   nmem0/med_w_dur/                                   [Kernel PMU event]
>   nmem0/mem_life/                                    [Kernel PMU event]
>   nmem0/poweron_secs/                                [Kernel PMU event]
>   ...
>   nmem1/mem_life/                                    [Kernel PMU event]
>   nmem1/poweron_secs/                                [Kernel PMU event]
>
> Patch1:
>         Introduces the nvdimm_pmu structure
> Patch2:
>         Adds common interface to add arch/platform specific data
>         includes nvdimm device pointer, pmu data along with
>         pmu event functions. It also defines supported event list
>         and adds attribute groups for format, events and cpumask.
>         It also adds code for cpu hotplug support.
> Patch3:
>         Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
>         nmem* pmu. It fills in the nvdimm_pmu structure with pmu name,
>         capabilities, cpumask and event functions and then registers
>         the pmu by adding callbacks to register_nvdimm_pmu.
> Patch4:
>         Sysfs documentation patch
>
> Changelog
> ---
> Resend v5 -> v6
> - No logic change, just a rebase to latest upstream and
>   tested the patchset.
>
> - Link to the patchset Resend v5: https://lkml.org/lkml/2021/11/15/3979
>
> v5 -> Resend v5
> - Resend the patchset
>
> - Link to the patchset v5: https://lkml.org/lkml/2021/9/28/643
>
> v4 -> v5:
> - Remove multiple variables defined in nvdimm_pmu structure include
>   name and pmu functions(event_int/add/del/read) as they are just
>   used to copy them again in pmu variable. Now we are directly doing
>   this step in arch specific code as suggested by Dan Williams.
>
> - Remove attribute group field from nvdimm pmu structure and
>   defined these attribute groups in common interface which
>   includes format, event list along with cpumask as suggested by
>   Dan Williams.
>   Since we added static defination for attrbute groups needed in
>   common interface, removes corresponding code from papr.
>
> - Add nvdimm pmu event list with event codes in the common interface.
>
> - Remove Acked-by/Reviewed-by/Tested-by tags as code is refactored
>   to handle review comments from Dan.

I don't think review comments should invalidate the Acked-by tags in
this case. Nothing fundamentally changed in the approach, and I would
like to have the perf ack before taking this through the nvdimm tree.

Otherwise this looks good to me.

Peter, might you have a chance to re-Ack this series, or any concerns
about me retrieving those Acks from the previous postings?
