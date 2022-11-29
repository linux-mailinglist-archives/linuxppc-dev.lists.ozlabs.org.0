Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9093763B664
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 01:09:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLjPz2zcNz3f2x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 11:09:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F6Wj9aQv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F6Wj9aQv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLjP333QLz2xf6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 11:08:54 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASNfvZR025208
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 00:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=r0ZH6e4ypPEI20hbuhkyr+QrxAlZBqH6EY/IIhQQZ+o=;
 b=F6Wj9aQvmeGdMwJsgB/Cs11THL7fvY9Czn0o7E/eUwdNQPdmLRqJFEC9nw+TE33R6KQu
 NYRerV+JLpXMtB7muXvZVwhRoghrVy99/OehzYJtGopa7mw7RKvncuPTfMPdxa+iV+Nh
 9VPCEAHfu3F25xhuNUOF7eMozHh/0C8cTxbJH8UTe0lJyjofwZs80dWtbZEjidsup5gP
 uOUcm5NiAUFPQKLSqlm1smtv22ms+nRoYq8Z4VRnlcB++CAgeVyF3Sy9bdCLP6NqM8FE
 AfxyRILNx+OYy4InlKjfHnRX5uFET4sbxWr0YegB2g5ilSEip5Nz7Dxf7TT/CXitPtl1 gA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m56vugj5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 00:08:52 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASNwKCo013539
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 00:08:52 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m56vugj5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 00:08:52 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT05Pcp006089;
	Tue, 29 Nov 2022 00:08:50 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma05wdc.us.ibm.com with ESMTP id 3m3t71csj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 00:08:50 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AT08n0310617404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 00:08:50 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A308158057;
	Tue, 29 Nov 2022 00:08:49 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8743558059;
	Tue, 29 Nov 2022 00:08:49 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 00:08:49 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 10/13] powerpc/rtas: improve function information lookups
In-Reply-To: <5b4c4316bfe88a3f231ffe416ce34192189549db.camel@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-11-nathanl@linux.ibm.com>
 <5b4c4316bfe88a3f231ffe416ce34192189549db.camel@linux.ibm.com>
Date: Mon, 28 Nov 2022 18:08:49 -0600
Message-ID: <87r0xm8vvy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FrQOcU6iC6kZJ7Au1wrFTWxKxIQQ1yjQ
X-Proofpoint-GUID: aJjbj6IA9SX9nkb_AwX5XNeWUWeRNeoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_17,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=974 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211280173
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
>> Convert rtas_token() to use a lockless binary search on the function
>> table. Fall back to the old behavior for lookups against names that
>> are not known to be RTAS functions, but issue a warning. rtas_token()
>> is for function names; it is not a general facility for accessing
>> arbitrary properties of the /rtas node. All known misuses of
>> rtas_token() have been converted to more appropriate of_ APIs in
>> preceding changes.
>
> For in-kernel users, why not go all the way: make rtas_token() static
> and use it purely for the userspace API,

Not sure what userspace API refers to here, can you be more specific? I
don't think rtas_token() is exposed to user space.

> and switch kernel users over
> to using rtas_function_index directly?

Well, I have work in progress to transition all rtas_token() users to a
different API, but using opaque symbolic handles rather than exposing
the indexes. Something like:

/*
 * Opaque handle for client code to refer to RTAS functions. All valid
 * function handles are build-time constants prefixed with RTAS_FN_.
 */
typedef struct {
	enum rtas_function_index index;
} rtas_fn_handle_t;

#define rtas_fn_handle(x_) (const rtas_fn_handle_t) { .index = rtas_fnidx(x_), }

#define RTAS_FN_CHECK_EXCEPTION                   rtas_fn_handle(CHECK_EXCEPTION)
#define RTAS_FN_DISPLAY_CHARACTER                 rtas_fn_handle(DISPLAY_CHARACTER)
#define RTAS_FN_EVENT_SCAN                        rtas_fn_handle(EVENT_SCAN)

...

/**
 * rtas_function_token() - RTAS function token lookup.
 * @handle: Function handle, e.g. RTAS_FN_EVENT_SCAN.
 *
 * Context: Any context.
 * Return: the token value for the function if implemented by this platform,
 *         otherwise RTAS_UNKNOWN_SERVICE.
 */
s32 rtas_function_token(const rtas_fn_handle_t handle)
{
	const size_t index = handle.index;
	const bool out_of_bounds = index >= ARRAY_SIZE(rtas_function_table);

	if (WARN_ONCE(out_of_bounds, "invalid function index %zu", index))
		return RTAS_UNKNOWN_SERVICE;

	return rtas_function_table[index].token;
}

But that's a tree-wide change that would touch various drivers, and I
feel like the current series is what I can reasonably hope to get
applied right now.
