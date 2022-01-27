Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C28B49EDAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 22:45:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlDfd07G7z30Md
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 08:45:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pQIYfGL9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pQIYfGL9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl1Mg6yV3z30N9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 00:17:03 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RDDSrU027765; 
 Thu, 27 Jan 2022 13:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=XeEMBEwWWG+dHaYo1yluoFv6fP/RuA+zAGBEUfwky5w=;
 b=pQIYfGL9is9OvvLkJuKSaZ5N96qrrmnAtSSbEvgitpPiPN15jIPMTwMY601MRnoEze4Z
 i9AOm9SKTu+yR6krbp4ErhzGOhIeus4uX/CNLQ9MWRZSUl9a135UfFeIfrf7xm9u4mfC
 y71IEH/neWzn4c0Gw+K5yDvTNtW549t1n99xqO8N2qEq5cpdnNVvuJwWKPzLv1LR+HQP
 tIDOS2SCz9VteNKwfk5qAX07w4icnObvoB5TfS4ktiXm7R3XalQtCiTYWkNANfjs0HUR
 /Hg+7b/Xb56zgfwCXUdZayru562ka5cqzL6HsdKTG10U8VqgLBWcfbXWapjhd4o+bPs+ tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dupsuqqbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 13:16:38 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20RDGb16008275;
 Thu, 27 Jan 2022 13:16:38 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dupsuqqb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 13:16:37 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20RDCRVC001264;
 Thu, 27 Jan 2022 13:16:35 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3dr96jx7ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 13:16:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20RDGWaZ21496254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 13:16:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 268F84C052;
 Thu, 27 Jan 2022 13:16:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD5AD4C040;
 Thu, 27 Jan 2022 13:16:31 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Jan 2022 13:16:31 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
 <yt9dy231gzae.fsf@linux.ibm.com> <YfKPmFJ2MGsem4VB@FVFF77S0Q05N>
 <20220127074601.41a3773d@rorschach.local.home>
 <YfKZXvB9vCN1bA1c@FVFF77S0Q05N>
Date: Thu, 27 Jan 2022 14:16:31 +0100
In-Reply-To: <YfKZXvB9vCN1bA1c@FVFF77S0Q05N> (Mark Rutland's message of "Thu, 
 27 Jan 2022 13:08:46 +0000")
Message-ID: <yt9dsft9gvyo.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1HlEL2zE9lD4mxEQU6kQxS4U-kPK0-JT
X-Proofpoint-ORIG-GUID: l8jXR6C3cwAQe74SA6titpwuHpkUaO0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270079
X-Mailman-Approved-At: Fri, 28 Jan 2022 08:44:30 +1100
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
Cc: keescook@chromium.org, hca@linux.ibm.com, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Sachin Sant <sachinp@linux.ibm.com>,
 Yinan Liu <yinan@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
 ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark Rutland <mark.rutland@arm.com> writes:

> On Thu, Jan 27, 2022 at 07:46:01AM -0500, Steven Rostedt wrote:
>> On Thu, 27 Jan 2022 12:27:04 +0000
>> Mark Rutland <mark.rutland@arm.com> wrote:
>> 
>> > Ah, so those non-ELF relocations for the mcount_loc table just mean "apply the
>> > KASLR offset here", which is equivalent for all entries.
>> > 
>> > That makes sense, thanks!
>> 
>> And this is why we were having such a hard time understanding each other ;-)
>
> ;)
>
> With that in mind, I think that we understand that the build-time sort works
> for:
>
> * arch/x86, becuase the non-ELF relocations for mcount_loc happen to be
>   equivalent.
>  
> * arch/arm, because there's no dynamic relocaiton and the mcount_loc entries
>   have been finalized prior to sorting.
>
> ... but doesn't work for anyone else (including arm64) because the ELF
> relocations are not equivalent, and need special care that is not yet
> implemented.

For s390 my idea is to just skip the addresses between __start_mcount_loc
and __stop_mcount_loc, because for these addresses we know that they are
64 bits wide, so we just need to add the KASLR offset.

I'm thinking about something like this:

diff --git a/arch/s390/boot/compressed/decompressor.h b/arch/s390/boot/compressed/decompressor.h
index f75cc31a77dd..015d7e2e94ef 100644
--- a/arch/s390/boot/compressed/decompressor.h
+++ b/arch/s390/boot/compressed/decompressor.h
@@ -25,6 +25,8 @@ struct vmlinux_info {
 	unsigned long rela_dyn_start;
 	unsigned long rela_dyn_end;
 	unsigned long amode31_size;
+	unsigned long start_mcount_loc;
+	unsigned long stop_mcount_loc;
 };
 
 /* Symbols defined by linker scripts */
diff --git a/arch/s390/boot/startup.c b/arch/s390/boot/startup.c
index 1aa11a8f57dd..7bb0d88db5c6 100644
--- a/arch/s390/boot/startup.c
+++ b/arch/s390/boot/startup.c
@@ -88,6 +88,11 @@ static void handle_relocs(unsigned long offset)
 	dynsym = (Elf64_Sym *) vmlinux.dynsym_start;
 	for (rela = rela_start; rela < rela_end; rela++) {
 		loc = rela->r_offset + offset;
+		if ((loc >= vmlinux.start_mcount_loc) &&
+		    (loc < vmlinux.stop_mcount_loc)) {
+			(*(unsigned long *)loc) += offset;
+			continue;
+		}
 		val = rela->r_addend;
 		r_sym = ELF64_R_SYM(rela->r_info);
 		if (r_sym) {
@@ -232,6 +237,8 @@ static void offset_vmlinux_info(unsigned long offset)
 	vmlinux.rela_dyn_start += offset;
 	vmlinux.rela_dyn_end += offset;
 	vmlinux.dynsym_start += offset;
+	vmlinux.start_mcount_loc += offset;
+	vmlinux.stop_mcount_loc += offset;
 }
 
 static unsigned long reserve_amode31(unsigned long safe_addr)
diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index 42c43521878f..51c773405608 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -213,6 +213,8 @@ SECTIONS
 		QUAD(__rela_dyn_start)				/* rela_dyn_start */
 		QUAD(__rela_dyn_end)				/* rela_dyn_end */
 		QUAD(_eamode31 - _samode31)			/* amode31_size */
+		QUAD(__start_mcount_loc)
+		QUAD(__stop_mcount_loc)
 	} :NONE
 
 	/* Debugging sections.	*/

Not sure whether that would also work on power, and also not sure
whether i missed something thinking about that. Maybe it doesn't even
work. ;-)
