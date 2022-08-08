Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E35C058C53A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 11:02:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1VbP5qjJz3c4Q
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 19:02:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cWkLedZb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cWkLedZb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1VZf5Sygz2xrR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 19:02:18 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2788uL5h024923
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 09:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=J93+Dmxwra76yEAVoZKBOrn0NJk8RHWmDXp24JUofaI=;
 b=cWkLedZbqsIkhcWZQpvO6eKeyuWMJdhXGQU+3bN6ZHfmV6zuWThZfLHVA8AcU62EHnBc
 vtBfdBlpf7c7cuXxBGq+UwsgFc9NtqRwU35UZfrEBwpYEpaUtD9ci/yKhKePcOmRRwz0
 yjhUaX8iKTCchn83jJxCZ823mchdoB3zrqAnuL8UsDGGs7Pyojd8DrpikWUQ28Rssqz4
 UMxcnDVSddPWDe4ZFX5BhJC0VKcxzMLvcpRyUZHKY1JyFGOftgAdfsyR6n1ehRIhINNP
 uIuT9V3SYS7D6lpdEL+zTwX22DUcCoYlaUfSsasf3S96cOq80qUghAUxQFPN5pgxgJKd QA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3htydk84j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Aug 2022 09:02:15 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2788ve8l028326
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 09:02:14 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3htydk84h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 09:02:14 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2788qP7H009716;
	Mon, 8 Aug 2022 09:02:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06fra.de.ibm.com with ESMTP id 3hsfjhrsjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 09:02:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 278929KF29753658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 09:02:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA104A4055;
	Mon,  8 Aug 2022 09:02:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28D52A404D;
	Mon,  8 Aug 2022 09:02:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 09:02:09 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4A2356010A;
	Mon,  8 Aug 2022 19:02:04 +1000 (AEST)
Message-ID: <e9f83e38f11345bb097328d4a74dd6bbc98a347c.camel@linux.ibm.com>
Subject: Re: [PATCH v2 12/14] powerpc/64s: Use {NULLIFY,SAVE,REST}_GPRS
 macros in sc, scv 0 handlers
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Aug 2022 19:02:03 +1000
In-Reply-To: <20220725063136.121108-1-rmclure@linux.ibm.com>
References: <20220725063136.121108-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HJX8X4LfKoOmBvhTH71ofmtlAZv8u-Hi
X-Proofpoint-ORIG-GUID: bcCWFMbb3oY1wDFE3EU208y81XYrN0Em
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_05,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208080046
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-07-25 at 16:31 +1000, Rohan McLure wrote:
> Use the convenience macros for saving/clearing/restoring gprs in
> keeping
> with syscall calling conventions. The plural variants of these macros
> can store a range of registers for concision.
> 
> This works well when the save-to-stack logic is simple (a gpr is
> saved
> to its corresponding offset in the struct pt_regs on the stack).
> Wherever a different gpr is storing the initial value of another gpr
> at
> the interrupt location, care must be taken to issue the correct save
> instruction and so the macros are not applied in neighbouring stores.

This second paragraph is a bit unclear, I think I understand what
you're saying but could you rephrase it for clarity?

> 
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Update summary
> ---
>  arch/powerpc/kernel/interrupt_64.S | 29 ++++++----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/interrupt_64.S
> b/arch/powerpc/kernel/interrupt_64.S
> index 34167cfa5d60..efaf162fa772 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -71,12 +71,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>         mfcr    r12
>         li      r11,0
>         /* Save syscall parameters in r3-r8 */
> -       std     r3,GPR3(r1)
> -       std     r4,GPR4(r1)
> -       std     r5,GPR5(r1)
> -       std     r6,GPR6(r1)
> -       std     r7,GPR7(r1)
> -       std     r8,GPR8(r1)
> +       SAVE_GPRS(3, 8, r1)
>         /* Zero r9-r12, this should only be required when restoring
> all GPRs */
>         std     r11,GPR9(r1)
>         std     r11,GPR10(r1)
> @@ -156,17 +151,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>         /* Could zero these as per ABI, but we may consider a
> stricter ABI
>          * which preserves these if libc implementations can benefit,
> so
>          * restore them for now until further measurement is done. */
> -       ld      r0,GPR0(r1)
> -       ld      r4,GPR4(r1)
> -       ld      r5,GPR5(r1)
> -       ld      r6,GPR6(r1)
> -       ld      r7,GPR7(r1)
> -       ld      r8,GPR8(r1)
> +       REST_GPR(0, r1)
> +       REST_GPRS(4, 8, r1)
>         /* Zero volatile regs that may contain sensitive kernel data
> */
> -       li      r9,0
> -       li      r10,0
> -       li      r11,0
> -       li      r12,0
> +       NULLIFY_GPRS(9, 12)
>         mtspr   SPRN_XER,r0
>  
>         /*
> @@ -188,7 +176,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>         ld      r4,_LINK(r1)
>         ld      r5,_XER(r1)
>  
> -       ld      r0,GPR0(r1)
> +       REST_GPR(0, r1)
>         mtcr    r2
>         mtctr   r3
>         mtlr    r4
> @@ -256,12 +244,7 @@ END_BTB_FLUSH_SECTION
>         mfcr    r12
>         li      r11,0
>         /* Save syscall parameters in r3-r8 */
> -       std     r3,GPR3(r1)
> -       std     r4,GPR4(r1)
> -       std     r5,GPR5(r1)
> -       std     r6,GPR6(r1)
> -       std     r7,GPR7(r1)
> -       std     r8,GPR8(r1)
> +       SAVE_GPRS(3, 8, r1)
>         /* Zero r9-r12, this should only be required when restoring
> all GPRs */
>         std     r11,GPR9(r1)
>         std     r11,GPR10(r1)

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

