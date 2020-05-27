Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 119571E4DC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 21:00:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XKs51lKQzDqVT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 05:00:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=AFDSD49c; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XKnb6pgWzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 04:56:59 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id e10so21176072edq.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 11:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yhcFFsKj7N+XV8AMHJECIG5DAX+f8KJohJMbtgsnPKk=;
 b=AFDSD49cFylraLBD8OCsBvKLCgfANQjtXQzpSAYlTF6Rv8Dyagb3TLPZK1G4myVkYi
 cgrEWZNeCtmNDURPKDi156IaV5KGpxIVtFJq1iysfivwJJn+Hqk6RHU+hxBMeGeHJItx
 qrrdgEi8Tk4gM7dnw9RHhVlFwcE2Vs4DRPoYlcHOd8rW8L5cDBPOhMKneNPwniAKfSoM
 qYrZxyEpn9GeZhMDVEie/I+AKvGmV+tKYBTpLQA06+dcCFjFFUriCuv45ObESJGVixQn
 O0UBFJhYwsMUNrOWlOLZBzc8n/Ci/6z3XT8+LU0DgS8TI1HKkWmsED5ysHTFpPNc2+eC
 /iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yhcFFsKj7N+XV8AMHJECIG5DAX+f8KJohJMbtgsnPKk=;
 b=ij2h/BgLAmS7tkBJLgtxH4wtBRBBek/QuYo0dnrZVc4reigKRQWeO84BtGXlRVOKrS
 9RrR9qC6zxE8/CkrHMxOeRSx5FxYu8ERE1nK4RxollP7d4XuNcKd60KBPKttg7SR0Pgn
 zNDJPTCqXg31KjZnJTZc7Yj7MefSXJgTXAP13BkfM2afL7Mk6uq4D8I1fh6fzH4MS2Jd
 7fKCujkTFamZXr4eO+KE71wxB5SlQzr0yMZN7sH07zg2gBgCkTGorrkT/Hwoy7UhlrWp
 UdEhXY5RFC/bBBg/szRsxqigYZab3KXlFKI0VJ2UyNvJRephmYIp2ZtyKs3Ac1Nkm9EN
 RerQ==
X-Gm-Message-State: AOAM531RyS1bVn6W7T4cjHmVMBtAAAdCPPVRduvhvMjZDNOWWPuC8AAm
 SbY4zilyWh9dl/PdimsqpEl+qgcFCjMn4a1hCaSaWQ==
X-Google-Smtp-Source: ABdhPJwI+ATlYbLOn+OYCZPcy6MrH5Uw8AiuZ7BVCw67ST1mkLWvplIHlYCQn8Tp39Sljyhjk/Tm+0wSN17kQ6/Jzk4=
X-Received: by 2002:a05:6402:1c1e:: with SMTP id
 ck30mr24473373edb.154.1590605815518; 
 Wed, 27 May 2020 11:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200527041244.37821-1-vaibhav@linux.ibm.com>
 <20200527041244.37821-2-vaibhav@linux.ibm.com>
In-Reply-To: <20200527041244.37821-2-vaibhav@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 27 May 2020 11:56:44 -0700
Message-ID: <CAPcyv4jXp1FocSe-fFBA_00TnsjPudrBCuHBfv+zwHA_R0353A@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] powerpc: Document details on H_SCM_HEALTH hcall
To: Vaibhav Jain <vaibhav@linux.ibm.com>
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Ira Weiny <ira.weiny@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 26, 2020 at 9:13 PM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> Add documentation to 'papr_hcalls.rst' describing the bitmap flags
> that are returned from H_SCM_HEALTH hcall as per the PAPR-SCM
> specification.
>

Please do a global s/SCM/PMEM/ or s/SCM/NVDIMM/. It's unfortunate that
we already have 2 ways to describe persistent memory devices, let's
not perpetuate a third so that "grep" has a chance to find
interrelated code across architectures. Other than that this looks
good to me.

> Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
> v7..v8:
> * Added a clarification on bit-ordering of Health Bitmap
>
> Resend:
> * None
>
> v6..v7:
> * None
>
> v5..v6:
> * New patch in the series
> ---
>  Documentation/powerpc/papr_hcalls.rst | 45 ++++++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
> index 3493631a60f8..45063f305813 100644
> --- a/Documentation/powerpc/papr_hcalls.rst
> +++ b/Documentation/powerpc/papr_hcalls.rst
> @@ -220,13 +220,50 @@ from the LPAR memory.
>  **H_SCM_HEALTH**
>
>  | Input: drcIndex
> -| Out: *health-bitmap, health-bit-valid-bitmap*
> +| Out: *health-bitmap (r4), health-bit-valid-bitmap (r5)*
>  | Return Value: *H_Success, H_Parameter, H_Hardware*
>
>  Given a DRC Index return the info on predictive failure and overall health of
> -the NVDIMM. The asserted bits in the health-bitmap indicate a single predictive
> -failure and health-bit-valid-bitmap indicate which bits in health-bitmap are
> -valid.
> +the NVDIMM. The asserted bits in the health-bitmap indicate one or more states
> +(described in table below) of the NVDIMM and health-bit-valid-bitmap indicate
> +which bits in health-bitmap are valid. The bits are reported in
> +reverse bit ordering for example a value of 0xC400000000000000
> +indicates bits 0, 1, and 5 are valid.
> +
> +Health Bitmap Flags:
> +
> ++------+-----------------------------------------------------------------------+
> +|  Bit |               Definition                                              |
> ++======+=======================================================================+
> +|  00  | SCM device is unable to persist memory contents.                      |
> +|      | If the system is powered down, nothing will be saved.                 |
> ++------+-----------------------------------------------------------------------+
> +|  01  | SCM device failed to persist memory contents. Either contents were not|
> +|      | saved successfully on power down or were not restored properly on     |
> +|      | power up.                                                             |
> ++------+-----------------------------------------------------------------------+
> +|  02  | SCM device contents are persisted from previous IPL. The data from    |
> +|      | the last boot were successfully restored.                             |
> ++------+-----------------------------------------------------------------------+
> +|  03  | SCM device contents are not persisted from previous IPL. There was no |
> +|      | data to restore from the last boot.                                   |
> ++------+-----------------------------------------------------------------------+
> +|  04  | SCM device memory life remaining is critically low                    |
> ++------+-----------------------------------------------------------------------+
> +|  05  | SCM device will be garded off next IPL due to failure                 |
> ++------+-----------------------------------------------------------------------+
> +|  06  | SCM contents cannot persist due to current platform health status. A  |
> +|      | hardware failure may prevent data from being saved or restored.       |
> ++------+-----------------------------------------------------------------------+
> +|  07  | SCM device is unable to persist memory contents in certain conditions |
> ++------+-----------------------------------------------------------------------+
> +|  08  | SCM device is encrypted                                               |
> ++------+-----------------------------------------------------------------------+
> +|  09  | SCM device has successfully completed a requested erase or secure     |
> +|      | erase procedure.                                                      |
> ++------+-----------------------------------------------------------------------+
> +|10:63 | Reserved / Unused                                                     |
> ++------+-----------------------------------------------------------------------+
>
>  **H_SCM_PERFORMANCE_STATS**
>
> --
> 2.26.2
>
