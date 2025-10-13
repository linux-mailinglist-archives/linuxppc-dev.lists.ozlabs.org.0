Return-Path: <linuxppc-dev+bounces-12784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0702BD10F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 03:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clK2v537Mz30P3;
	Mon, 13 Oct 2025 12:07:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760317671;
	cv=none; b=kqc726lXZ4JYTd8EV1VGoVlhF698xflNElrFSb5xy6LGU/B6f/ZvBXnFrqM2c4HJ/YRAXrjuAaM8mxAzCD1oZl9TzBJNiRXZ5q81ACKYdhOMObi1ZHYwVJnHc/tMavBypthymoaNnUjUamHoHAvEVENgSf4mv0DuXNa/iePrqRR+1GCus3byKdfy3edDzXYTMsUxsu+D9q7TcZrkwhuCmT7bxmKL13ZjHQ9IDbBT/88k6Jmb9OLuXgi+nwrFOOcRwm7FT+BZtOi8DZIG/2WuaCYiih+jsvx0cilwlnehjIL1DGtEh6fU18HG2HYxU0mFSR2D+Be/kZXpcjamhyRWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760317671; c=relaxed/relaxed;
	bh=sIdGQ/A0g1NW3311vlrLeqxL++k7l1jS1lqru5dUUuw=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=kkOP4xUQj8XT42uwJS0OTRXhmX99KwvM2KRdWmD7UWlesHXnkxvRLjEjG/byC2ADmcmNP4VZBkn4xCYgicqEF3gjRiKMp1Dmj8B6prSTt2F/iShM1IKIxwk4V17Z2LtKOBjssXDQnk8hq2dibqYSLdrjTKdD0IM951/S1kvRWcThJcwiD0Z8lPOwkDG/Kh4Q6N+ppCP89NCfuxvTjiGKXY471/jEBFx2CmADj8Dk8tc+RMsnwJGPJuvA+GSvq4DPc1lMaIR4IUMXNG37ySR5vFXog28WMipl/kAIsfDtzSbfceGKsqPVVbUr+Ej/IaVA0o8w75ZeDmKZczCJ5GGcGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J05xegm6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J05xegm6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clK2t04zbz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 12:07:49 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CNGvnr019961
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 01:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=sIdGQ/A0g1NW3311vlrLeqxL++k7l1
	jS1lqru5dUUuw=; b=J05xegm6ZeGzuXCvT7Mg8APzaK23wGYKtMbsHokHewDqlp
	O66ZAtM8vM7ooy7ljCKe6aPvTq2zTI1sH32dGRb0l24VgMnwpaOfnhC/fyd4y3lg
	6WA5KzyKjPxGZVzuLoYucipCyudHtkeq9eJOViLOSa0zKNDRXh2m2L9AOjnxhNF3
	QH0+Kuh0LJnFdSOnyLLvRyKRRiann1LiKIx2jdKxz807Oyq0/pDkzuJrkjIfi+bK
	hBnd0/U2avdrvTmfg8wt9jzqvRpqtO1nMZjDj01VcfcSNMs1IAiA/SwATt8kKT/0
	3MOHty1eumldGouv9X+t8hJFxCUkvBv6QtzvyP6A==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qcnqxm2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 01:07:46 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59CKvp6o015052
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 01:07:45 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49r3sj3chg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 01:07:45 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59D17iwj34668882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 01:07:44 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E52F520043
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 01:07:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68C6220040
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 01:07:43 +0000 (GMT)
Received: from [9.39.20.93] (unknown [9.39.20.93])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 01:07:43 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------Fj4r01fWpXDXE01FndrJSVh0"
Message-ID: <6d8fad66-d3f8-4015-b7ee-5b8ebde44b1c@linux.ibm.com>
Date: Mon, 13 Oct 2025 06:37:42 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/3] kbuild: Add objtool integration for PowerPC
 feature fixups
To: linuxppc-dev@lists.ozlabs.org
References: <20250929080456.26538-1-sv@linux.ibm.com>
 <20250929080456.26538-3-sv@linux.ibm.com> <aOF4223Q5egUS_in@levanger>
Content-Language: en-US
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <aOF4223Q5egUS_in@levanger>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=M5ZA6iws c=1 sm=1 tr=0 ts=68ec50e2 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=x6icFKpwvdMA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=_TN3Qcb_dLFjaPqXu20A:9 a=QEXdDO2ut3YA:10 a=GYhYIinywUO78CrttK0A:9
 a=ymhuLPKLwvxX0v5j:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
X-Proofpoint-GUID: WRZaKkWELm-o0sv_tvEz-PUr3APN8lkG
X-Proofpoint-ORIG-GUID: WRZaKkWELm-o0sv_tvEz-PUr3APN8lkG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDE0MCBTYWx0ZWRfXxdrpuqDMTEiu
 eRCr7cYLdbwnHnPB+aHA2SB5iE7V3yNsDT39ebz4EBkL2e30XLExJMM9abfagnjizkSqLRcRJck
 ELZx8leQqV7laRNAYFiAN77kAWLiR5rHy1sIiu0rRYKeS1StD8jZEFFakWCSjwsG9aInv3x5NgB
 96uiBA3cIQuBYi6p9LvISL54VVr8U2ZT1MsomVGtv3I1JnUgnQG33UtmKLsQrGaZjD/uJjD3da/
 uXnAtiKpjeqRi02ZWCBauuGdRoFrXfR8PefeKoH71bkfwQZ2rIZZg/dPWZVFAFPuX4tHBja8R2V
 clS9aS8EY0S1plhN/w8BmpyXCZ37USFTkyj81+RILBrWm6RBASi7PrKMGfPBm8IDkX+qbUTifvS
 uyH3gna0I/fsbRBDyssY51UHkS+HpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_09,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510100140
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------Fj4r01fWpXDXE01FndrJSVh0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicolas,

Thank you for the review and suggestions!

On 10/5/25 1:13 AM, Nicolas Schier wrote:
> On Mon, Sep 29, 2025 at 01:34:55PM +0530, Sathvika Vasireddy wrote:
>> Add build system support for PowerPC feature fixup processing:
>>
>> - Add HAVE_OBJTOOL_FTR_FIXUP config option for architectures that support
>>    build-time feature fixup processing
>> - Integrate objtool feature fixup processing into vmlinux build
>>
>> Suggested-by: Masahiro Yamada<masahiroy@kernel.org>
>> Signed-off-by: Sathvika Vasireddy<sv@linux.ibm.com>
>> ---
>>   Makefile                 |  7 +++++++
>>   arch/Kconfig             |  3 +++
>>   scripts/Makefile.lib     |  5 +++--
>>   scripts/Makefile.vmlinux | 13 ++++++++++++-
>>   4 files changed, 25 insertions(+), 3 deletions(-)
>>
> ...
>> diff --git a/arch/Kconfig b/arch/Kconfig
>> index d1b4ffd6e085..d870aab17cba 100644
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -1334,6 +1334,9 @@ config HAVE_UACCESS_VALIDATION
>>   	bool
>>   	select OBJTOOL
>>   
>> +config HAVE_OBJTOOL_FTR_FIXUP
> For me, FTR is not that natural to parse.  Is there a reason for using
> FTR instead of FEATURE?

The naming comes from the PowerPC-specific section names (__ftr_alt_*) , 
and (*ftr_fixup) in vmlinux. However, I agree that FEATURE is more 
readable and I'll update all references to use FEATURE_FIXUP instead.

Also, on a second thought, since feature fixup is PowerPC-specific and 
no other architecture has this mechanism (please correct me if I am 
wrong), I will move HAVE_OBJTOOL_FEATURE_FIXUP from arch/Kconfig to 
arch/powerpc/Kconfig in the next version.

>
> ...
>> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
>> index b64862dc6f08..94cc2bba929a 100644
>> --- a/scripts/Makefile.vmlinux
>> +++ b/scripts/Makefile.vmlinux
>> @@ -84,7 +84,8 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>>   # Final link of vmlinux with optional arch pass after final link
>>   cmd_link_vmlinux =							\
>>   	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
>> -	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>> +	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)	\
>> +	$(cmd_objtool_vmlinux)
>>   
>>   targets += $(vmlinux-final)
>>   $(vmlinux-final): scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
>> @@ -131,3 +132,13 @@ existing-targets := $(wildcard $(sort $(targets)))
>>   -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
>>   
>>   .PHONY: $(PHONY)
>> +
>> +# objtool for vmlinux
>> +# ----------------------------------
>> +#
>> +#  For feature fixup, objtool does not run on individual
>> +#  translation units. Run this on vmlinux instead.
>> +
>> +ifdef CONFIG_HAVE_OBJTOOL_FTR_FIXUP
>> +cmd_objtool_vmlinux = ; $(objtool) --ftr-fixup --link $@
> This cmd_* definition is broken as $(call cmd,objtool_vmlinux) would be
> evaluated to '... ; ; ...' (shell syntax error).
>
> What about putting the objtool call right into cmd_link_vmlinux?

Sure, I will include the changes to put the objtool call into 
cmd_link_vmlinux as suggested, in the next version.

Thanks, Sathvika
--------------Fj4r01fWpXDXE01FndrJSVh0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hi Nicolas, <br>
      </font></p>
    <p><font face="monospace">Thank you for the review and suggestions!</font><br>
    </p>
    <div class="moz-cite-prefix"><font face="monospace">On 10/5/25 1:13
        AM, Nicolas Schier wrote:</font><br>
    </div>
    <blockquote type="cite" cite="mid:aOF4223Q5egUS_in@levanger">
      <pre wrap="" class="moz-quote-pre">On Mon, Sep 29, 2025 at 01:34:55PM +0530, Sathvika Vasireddy wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add build system support for PowerPC feature fixup processing:

- Add HAVE_OBJTOOL_FTR_FIXUP config option for architectures that support
  build-time feature fixup processing
- Integrate objtool feature fixup processing into vmlinux build

Suggested-by: Masahiro Yamada <a class="moz-txt-link-rfc2396E" href="mailto:masahiroy@kernel.org">&lt;masahiroy@kernel.org&gt;</a>
Signed-off-by: Sathvika Vasireddy <a class="moz-txt-link-rfc2396E" href="mailto:sv@linux.ibm.com">&lt;sv@linux.ibm.com&gt;</a>
---
 Makefile                 |  7 +++++++
 arch/Kconfig             |  3 +++
 scripts/Makefile.lib     |  5 +++--
 scripts/Makefile.vmlinux | 13 ++++++++++++-
 4 files changed, 25 insertions(+), 3 deletions(-)

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">...
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/arch/Kconfig b/arch/Kconfig
index d1b4ffd6e085..d870aab17cba 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1334,6 +1334,9 @@ config HAVE_UACCESS_VALIDATION
 	bool
 	select OBJTOOL
 
+config HAVE_OBJTOOL_FTR_FIXUP
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For me, FTR is not that natural to parse.  Is there a reason for using
FTR instead of FEATURE?</pre>
    </blockquote>
    <p><font face="monospace">The naming comes from the PowerPC-specific
        section names (__ftr_alt_*) , and (*ftr_fixup) in vmlinux.
        However, I agree that FEATURE is more readable and I'll update
        all references to use FEATURE_FIXUP instead.</font></p>
    <p><font face="monospace">Also, on a second thought, since feature
        fixup is PowerPC-specific and no other architecture has this
        mechanism (please correct me if I am wrong), I will move
        HAVE_OBJTOOL_FEATURE_FIXUP from arch/Kconfig to
        arch/powerpc/Kconfig in the next version.<br>
      </font></p>
    <blockquote type="cite" cite="mid:aOF4223Q5egUS_in@levanger">
      <pre wrap="" class="moz-quote-pre">

...
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b64862dc6f08..94cc2bba929a 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -84,7 +84,8 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 # Final link of vmlinux with optional arch pass after final link
 cmd_link_vmlinux =							\
 	$&lt; "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
-	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
+	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)	\
+	$(cmd_objtool_vmlinux)
 
 targets += $(vmlinux-final)
 $(vmlinux-final): scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
@@ -131,3 +132,13 @@ existing-targets := $(wildcard $(sort $(targets)))
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
 .PHONY: $(PHONY)
+
+# objtool for vmlinux
+# ----------------------------------
+#
+#  For feature fixup, objtool does not run on individual
+#  translation units. Run this on vmlinux instead.
+
+ifdef CONFIG_HAVE_OBJTOOL_FTR_FIXUP
+cmd_objtool_vmlinux = ; $(objtool) --ftr-fixup --link $@
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This cmd_* definition is broken as $(call cmd,objtool_vmlinux) would be
evaluated to '... ; ; ...' (shell syntax error).

What about putting the objtool call right into cmd_link_vmlinux?</pre>
    </blockquote>
    <p><font face="monospace">Sure, I will include the changes to put
        the objtool call into cmd_link_vmlinux as suggested, in the next
        version.</font><span style="white-space: pre-wrap">
</span></p>
    <font face="monospace"><span style="white-space: pre-wrap">Thanks,
Sathvika</span></font><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------Fj4r01fWpXDXE01FndrJSVh0--


