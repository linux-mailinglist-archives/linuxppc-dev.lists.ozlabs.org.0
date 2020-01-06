Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50346130FBD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 10:49:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rrMQ24kMzDqDt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 20:49:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rrJS1dRNzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 20:47:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47rrJR747Xz8t0B
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 20:47:03 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47rrJR6RtHz9sR1; Mon,  6 Jan 2020 20:47:03 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47rrJQ1Y8rz9sPJ
 for <linuxppc-dev@ozlabs.org>; Mon,  6 Jan 2020 20:47:01 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0069krqo009216
 for <linuxppc-dev@ozlabs.org>; Mon, 6 Jan 2020 04:46:59 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xb8n0murs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 06 Jan 2020 04:46:59 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Mon, 6 Jan 2020 09:46:57 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 Jan 2020 09:46:55 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0069k6jC39387414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 09:46:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64549AE04D;
 Mon,  6 Jan 2020 09:46:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34B64AE045;
 Mon,  6 Jan 2020 09:46:52 +0000 (GMT)
Received: from [9.124.31.198] (unknown [9.124.31.198])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2020 09:46:52 +0000 (GMT)
Subject: Re: [RFC 1/3] powerpc/powernv: Interface to define support and
 preference for a SPR
To: Ram Pai <linuxram@us.ibm.com>
References: <20191204093255.11849-1-psampat@linux.ibm.com>
 <20191204093255.11849-2-psampat@linux.ibm.com>
 <20200103232457.GH5556@oc0525413822.ibm.com>
From: Pratik Sampat <psampat@linux.ibm.com>
Date: Mon, 6 Jan 2020 15:16:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200103232457.GH5556@oc0525413822.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20010609-0012-0000-0000-0000037AD5C1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010609-0013-0000-0000-000021B6EE1F
Message-Id: <75611f4d-51f8-33ac-dcd5-0016bebee183@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_02:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060090
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
Cc: ego@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, pratik.sampat@in.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Ram,

Thank you for your reviewing the patches.

>> +/* Interface for the stop state supported and preference */
>> +#define SELF_RESTORE_TYPE    0
>> +#define SELF_SAVE_TYPE       1
>> +
>> +#define NR_PREFERENCES    2
>> +#define PREFERENCE_SHIFT  8
>> +#define PREFERENCE_MASK   0xff
>> +
>> +#define UNSUPPORTED         0x0
>> +#define SELF_RESTORE_STRICT 0x01
>> +#define SELF_SAVE_STRICT    0x10
>> +
>> +/*
>> + * Bitmask defining the kind of preferences available.
>> + * Note : The higher to lower preference is from LSB to MSB, with a shift of
>> + * 8 bits.
> A minor comment.
>
> Is there a reason why shift is 8?  Shift of 4 must be sufficient,
> and a mask of '0xf' should do. And SELF_SAVE_STRICT can be 0x2.
>
>
Yes, you're right! We could do away with using fewer bits here.

>> +/* Caching the lpcr & ptcr support to use later */
>> +static bool is_lpcr_self_save;
>> +static bool is_ptcr_self_save;
> I understand why you need to track the status of PTCR register.
> But its not clear, why LPCR register's save status need to be tracked?
>
Normally it does not but LPCR was previously unsupported in self-restore
and the kernel saved and restored its value in context. Now that we have
support for saving LPCR automatically I believe we leverage it and
make sure the kernel does not do redundant work.

>> +
>> +struct preferred_sprs {
>> +	u64 spr;
>> +	u32 preferred_mode;
>> +	u32 supported_mode;
>> +};
>> +
>> +struct preferred_sprs preferred_sprs[] = {
>> +	{
>> +		.spr = SPRN_HSPRG0,
>> +		.preferred_mode = PREFER_RESTORE_SAVE,
>> +		.supported_mode = SELF_RESTORE_STRICT,
>> +	},
>> +	{
>> +		.spr = SPRN_LPCR,
>> +		.preferred_mode = PREFER_RESTORE_SAVE,
>> +		.supported_mode = SELF_RESTORE_STRICT,
>> +	},
>> +	{
>> +		.spr = SPRN_PTCR,
>> +		.preferred_mode = PREFER_SAVE_RESTORE,
>> +		.supported_mode = SELF_RESTORE_STRICT,
>> +	},
>> +	{
>> +		.spr = SPRN_HMEER,
>> +		.preferred_mode = PREFER_RESTORE_SAVE,
>> +		.supported_mode = SELF_RESTORE_STRICT,
>> +	},
>> +	{
>> +		.spr = SPRN_HID0,
>> +		.preferred_mode = PREFER_RESTORE_SAVE,
>> +		.supported_mode = SELF_RESTORE_STRICT,
>> +	},
>> +	{
>> +		.spr = P9_STOP_SPR_MSR,
>> +		.preferred_mode = PREFER_RESTORE_SAVE,
>> +		.supported_mode = SELF_RESTORE_STRICT,
>> +	},
>> +	{
>> +		.spr = P9_STOP_SPR_PSSCR,
>> +		.preferred_mode = PREFER_SAVE_RESTORE,
>> +		.supported_mode = SELF_RESTORE_STRICT,
>> +	},
>> +	{
>> +		.spr = SPRN_HID1,
>> +		.preferred_mode = PREFER_RESTORE_SAVE,
>> +		.supported_mode = SELF_RESTORE_STRICT,
>> +	},
>> +	{
>> +		.spr = SPRN_HID4,
>> +		.preferred_mode = PREFER_RESTORE_SAVE,
>> +		.supported_mode = SELF_RESTORE_STRICT,
>> +	},
>> +	{
>> +		.spr = SPRN_HID5,
>> +		.preferred_mode = PREFER_RESTORE_SAVE,
>> +		.supported_mode = SELF_RESTORE_STRICT,
>> +	}
>> +};
> What determines the list of registers tracked in this table?
>
>
> .snip..
>
This list is of the SPRs of all the registers that the kernel is interested in
at wakeup. It has been refactored out as a list from what the kernel used
previously in the kernel.


