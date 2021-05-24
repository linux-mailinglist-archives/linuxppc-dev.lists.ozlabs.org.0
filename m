Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B238E65C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 14:11:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpbfz2Hz7z3bs9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 22:11:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SJPrli0+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msc@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SJPrli0+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpbfT1BsGz2ykF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 22:11:28 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OC3acd064090; Mon, 24 May 2021 08:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=jDHvzDPLw37qvWxMMMl22IELHnVxoaPzZ6JtzlWI908=;
 b=SJPrli0+IkbmRFk9J4TVYUQ9oTUsCnugHY+jb07cRa6SaN/5IE1wKauLFhW43Hk7xe/V
 zyNwZkjH1NWDjQ30tLtnGUvUX7bQXG1oYTl5X9yDuSQwnktLr0RNwbZNT7icfoLcAOtc
 ggY/JPsj8eGsp7SuQYmyofR3hfBBwrvIyGRdaTASOaw6ZhQIB9zApD+7nSQGXaABPx8h
 l39/keCb+8DV9mKWERBDbNF2yuOX9D0sTf/Flj3wLtL79Epenv8noBAbCOW5mqbEcEmE
 /K3eTuFFyXdpbLIU6sJBaUnKIgLDNQMtREEVJPu2pEM/6Hbu87YhuHpRDzm2AvvLohkQ Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38ra87tv7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 08:11:11 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14OC3cxS064226;
 Mon, 24 May 2021 08:11:11 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38ra87tv77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 08:11:11 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14OC73q7017246;
 Mon, 24 May 2021 12:11:10 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 38psk8te9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 12:11:10 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14OCB9hT30671232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 12:11:09 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76D2FAC065;
 Mon, 24 May 2021 12:11:09 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D70B7AC05F;
 Mon, 24 May 2021 12:11:07 +0000 (GMT)
Received: from TP480.linux.ibm.com (unknown [9.65.94.141])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 May 2021 12:11:07 +0000 (GMT)
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <1621385544.nttlk5qugb.astroid@bobo.none>
 <1621400263.gf0mbqhkrf.astroid@bobo.none> <87a6oo4312.fsf@linux.ibm.com>
 <87k0nr6ezw.fsf@oldenburg.str.redhat.com> <87eedz3li3.fsf@linux.ibm.com>
 <20210521205204.GA24309@altlinux.org>
User-agent: mu4e 1.4.10; emacs 27.2
From: Matheus Castanho <msc@linux.ibm.com>
To: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: Linux powerpc new system call instruction and ABI
In-reply-to: <20210521205204.GA24309@altlinux.org>
Date: Mon, 24 May 2021 09:11:06 -0300
Message-ID: <87a6ok2uxx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dXh77QyFFxp6TKxbR80PJ57BQbWLHVqR
X-Proofpoint-ORIG-GUID: SsS5K6-b9wIyy35LWBJsEB91NJaxHQWR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_07:2021-05-24,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240080
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Matheus Castanho via Libc-alpha <libc-alpha@sourceware.org>,
 linux-api@vger.kernel.org, musl@lists.openwall.com,
 Nicholas Piggin <npiggin@gmail.com>, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Dmitry V. Levin <ldv@altlinux.org> writes:

> On Fri, May 21, 2021 at 05:00:36PM -0300, Matheus Castanho wrote:
>> Florian Weimer <fweimer@redhat.com> writes:
>> > * Matheus Castanho via Libc-alpha:
>> >> From: Nicholas Piggin <npiggin@gmail.com>
>> >> Subject: [PATCH 1/1] powerpc: Fix handling of scv return error codes
>> >>
>> >> When using scv on templated ASM syscalls, current code interprets any
>> >> negative return value as error, but the only valid error codes are in
>> >> the range -4095..-1 according to the ABI.
>> >>
>> >> Reviewed-by: Matheus Castanho <msc@linux.ibm.com>
>> >
>> > Please reference bug 27892 in the commit message.  I'd also appreciate a
>> > backport to the 2.33 release branch (where you need to add NEWS manually
>> > to add the bug reference).
>>
>> No problem. [BZ #27892] appended to the commit title. I'll make sure to
>> backport to 2.33 as well.
>
> Could you also mention in the commit message that the change fixes
> 'signal.gen.test' strace test where it was observed initially?

Sure, no problem. I'll commit it later today.

--
Matheus Castanho
