Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 184F43595DB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 08:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGpjJ6FT7z3btg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 16:52:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=kRnzaFxi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=kRnzaFxi; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGphs4Hc4z2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 16:52:10 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 ep1-20020a17090ae641b029014d48811e37so2676176pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=zShxkn+uNVnh/91t00SP5Bio+UEtA6GTrxuEKv1jxbk=;
 b=kRnzaFxi5L4Rn7dHB4YR+OVzWBUWgLhFSvxXqQojNCOuYshXJDV6Z569FnL6HPVfVE
 /bdnm3lt4LoOofmmMInMtSBG/j4s6+DDw1oBoCvcgV5IsjYL01FgBRPpzIuv+5CabY/S
 Y5wiygY8Exn1QlWlqvii1sVD6fOccGf8K2Kd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=zShxkn+uNVnh/91t00SP5Bio+UEtA6GTrxuEKv1jxbk=;
 b=ArPW0QIR/W/ww9qpuIvW8+rM7LxK2s4sjpwZEt2COzD5+4ODgh7+jV3O1ClrVr5UTn
 HVle35Pr68Pb5xsAWMGn8G0HtJn/ZgEYBpt8TLrS088TCRFOvgRLVyzMkUfa1c22B66e
 BR8D1A8C58hWxvhgTnf4VZC2DzqOWTlEzfAlkiAmEUph4M0PngKStuEP28FBufP+eQuW
 5MelV+Bt01o37+hsV5W2oFrK6zOhP0wwdocuB1cOQk2Na0gcDjfqbm6CpMwiPdj9WC40
 6rH1MazRb/tv/nvuvw+i3+wg1AmF0k0Ce8fw4nBfhSXS8Eky1cDyB5aJ+BokxQc4HaWZ
 EllA==
X-Gm-Message-State: AOAM531J9a+ebIO0y2IqNA4u21IMPnS2zZfwual2xXqv/ENQ46JMVoJS
 Ks/vVAsWtJ6ugx23CLQvxYE/tw==
X-Google-Smtp-Source: ABdhPJxypOuI/H4hCujZXTt3Xja+fVkWI+mVOwpCXpTbk9HLHIeDxUbHDiZWkuoO60vlurEKil8yxQ==
X-Received: by 2002:a17:90a:df15:: with SMTP id
 gp21mr12538750pjb.127.1617951127580; 
 Thu, 08 Apr 2021 23:52:07 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-600a-73c5-13c4-f875.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:600a:73c5:13c4:f875])
 by smtp.gmail.com with ESMTPSA id v123sm1252401pfb.80.2021.04.08.23.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:52:07 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH v2 1/4] powerpc/selftests/ptrace-hwbreak: Add testcases
 for 2nd DAWR
In-Reply-To: <20210407054938.312857-2-ravi.bangoria@linux.ibm.com>
References: <20210407054938.312857-1-ravi.bangoria@linux.ibm.com>
 <20210407054938.312857-2-ravi.bangoria@linux.ibm.com>
Date: Fri, 09 Apr 2021 16:52:04 +1000
Message-ID: <87mtu8eyqz.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, shuah@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ravi,

> Add selftests to test multiple active DAWRs with ptrace interface.

It would be good if somewhere (maybe in the cover letter) you explain
what DAWR stands for and where to find more information about it. I
found the Power ISA v3.1 Book 3 Chapter 9 very helpful.

Apart from that, I don't have any specific comments about this patch. It
looks good to me, it seems to do what it says, and there are no comments
from checkpatch. It is a bit sparse in terms of comments but it is
consistent with the rest of the file so I can't really complain there :)

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Sample o/p:
>   $ ./ptrace-hwbreak
>   ...
>   PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DW ALIGNED, WO, len: 6: Ok
>   PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DW UNALIGNED, RO, len: 6: Ok
>   PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DAWR Overlap, WO, len: 6: Ok
>   PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DAWR Overlap, RO, len: 6: Ok
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  .../selftests/powerpc/ptrace/ptrace-hwbreak.c | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> index 2e0d86e0687e..a0635a3819aa 100644
> --- a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> @@ -194,6 +194,18 @@ static void test_workload(void)
>  		big_var[rand() % DAWR_MAX_LEN] = 'a';
>  	else
>  		cvar = big_var[rand() % DAWR_MAX_LEN];
> +
> +	/* PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DW ALIGNED, WO test */
> +	gstruct.a[rand() % A_LEN] = 'a';
> +
> +	/* PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DW UNALIGNED, RO test */
> +	cvar = gstruct.b[rand() % B_LEN];
> +
> +	/* PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DAWR Overlap, WO test */
> +	gstruct.a[rand() % A_LEN] = 'a';
> +
> +	/* PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DAWR Overlap, RO test */
> +	cvar = gstruct.a[rand() % A_LEN];
>  }
>  
>  static void check_success(pid_t child_pid, const char *name, const char *type,
> @@ -417,6 +429,69 @@ static void test_sethwdebug_range_aligned(pid_t child_pid)
>  	ptrace_delhwdebug(child_pid, wh);
>  }
>  
> +static void test_multi_sethwdebug_range(pid_t child_pid)
> +{
> +	struct ppc_hw_breakpoint info1, info2;
> +	unsigned long wp_addr1, wp_addr2;
> +	char *name1 = "PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DW ALIGNED";
> +	char *name2 = "PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DW UNALIGNED";
> +	int len1, len2;
> +	int wh1, wh2;
> +
> +	wp_addr1 = (unsigned long)&gstruct.a;
> +	wp_addr2 = (unsigned long)&gstruct.b;
> +	len1 = A_LEN;
> +	len2 = B_LEN;
> +	get_ppc_hw_breakpoint(&info1, PPC_BREAKPOINT_TRIGGER_WRITE, wp_addr1, len1);
> +	get_ppc_hw_breakpoint(&info2, PPC_BREAKPOINT_TRIGGER_READ, wp_addr2, len2);
> +
> +	/* PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DW ALIGNED, WO test */
> +	wh1 = ptrace_sethwdebug(child_pid, &info1);
> +
> +	/* PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DW UNALIGNED, RO test */
> +	wh2 = ptrace_sethwdebug(child_pid, &info2);
> +
> +	ptrace(PTRACE_CONT, child_pid, NULL, 0);
> +	check_success(child_pid, name1, "WO", wp_addr1, len1);
> +
> +	ptrace(PTRACE_CONT, child_pid, NULL, 0);
> +	check_success(child_pid, name2, "RO", wp_addr2, len2);
> +
> +	ptrace_delhwdebug(child_pid, wh1);
> +	ptrace_delhwdebug(child_pid, wh2);
> +}
> +
> +static void test_multi_sethwdebug_range_dawr_overlap(pid_t child_pid)
> +{
> +	struct ppc_hw_breakpoint info1, info2;
> +	unsigned long wp_addr1, wp_addr2;
> +	char *name = "PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DAWR Overlap";
> +	int len1, len2;
> +	int wh1, wh2;
> +
> +	wp_addr1 = (unsigned long)&gstruct.a;
> +	wp_addr2 = (unsigned long)&gstruct.a;
> +	len1 = A_LEN;
> +	len2 = A_LEN;
> +	get_ppc_hw_breakpoint(&info1, PPC_BREAKPOINT_TRIGGER_WRITE, wp_addr1, len1);
> +	get_ppc_hw_breakpoint(&info2, PPC_BREAKPOINT_TRIGGER_READ, wp_addr2, len2);
> +
> +	/* PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DAWR Overlap, WO test */
> +	wh1 = ptrace_sethwdebug(child_pid, &info1);
> +
> +	/* PPC_PTRACE_SETHWDEBUG 2, MODE_RANGE, DAWR Overlap, RO test */
> +	wh2 = ptrace_sethwdebug(child_pid, &info2);
> +
> +	ptrace(PTRACE_CONT, child_pid, NULL, 0);
> +	check_success(child_pid, name, "WO", wp_addr1, len1);
> +
> +	ptrace(PTRACE_CONT, child_pid, NULL, 0);
> +	check_success(child_pid, name, "RO", wp_addr2, len2);
> +
> +	ptrace_delhwdebug(child_pid, wh1);
> +	ptrace_delhwdebug(child_pid, wh2);
> +}
> +
>  static void test_sethwdebug_range_unaligned(pid_t child_pid)
>  {
>  	struct ppc_hw_breakpoint info;
> @@ -504,6 +579,10 @@ run_tests(pid_t child_pid, struct ppc_debug_info *dbginfo, bool dawr)
>  			test_sethwdebug_range_unaligned(child_pid);
>  			test_sethwdebug_range_unaligned_dar(child_pid);
>  			test_sethwdebug_dawr_max_range(child_pid);
> +			if (dbginfo->num_data_bps > 1) {
> +				test_multi_sethwdebug_range(child_pid);
> +				test_multi_sethwdebug_range_dawr_overlap(child_pid);
> +			}
>  		}
>  	}
>  }
> -- 
> 2.27.0
