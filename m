Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B326BDBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 09:14:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brrv91xwVzDqNn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 17:14:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AAZODF4m; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brrsb0dTzzDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 17:13:03 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08G71ABw091274; Wed, 16 Sep 2020 03:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hqdQ8Qf2wy6+TYxuytdrP4LbFLTvFIdX515FvozqQc4=;
 b=AAZODF4mToAq5hiUFp3Zei9sEKoyTRI3fCwOueaebD+a2cJIRN4j9znMRRG3o6Mq0ImS
 ecyamHlMh1niLz0FcWGfMqqDMHRmtKeiBoOfiOc2AfZeD4XbfspP3Rlwtr5Ts30vh9rp
 8RNB/M2KC9hns7GptqaqI+iCzHwn/Z4OzfKviuIXgH6oUykZitUrCLm/5zb4QA+kfCOA
 5co0+MnChNAX/mLzmlSxXNUZzxZTDHh5HNMp2YU5TBFARt2xmP0XxBkZ9JsPujKu4yD8
 m1/e3L6Xb8m57uz0lZ8ZXWDfp+xR23ZB4aEQoCAR7Fqsb2AZXbG/McG76GXK2UVILyRI kw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33kd95hec4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 03:12:59 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08G77sVY030595;
 Wed, 16 Sep 2020 07:12:58 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 33k623g6be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 07:12:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08G7Ctm820119948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 07:12:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E086AE0A5;
 Wed, 16 Sep 2020 07:12:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7EECAE097;
 Wed, 16 Sep 2020 07:12:54 +0000 (GMT)
Received: from [9.77.192.235] (unknown [9.77.192.235])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Sep 2020 07:12:54 +0000 (GMT)
Subject: Re: Injecting SLB miltihit crashes kernel 5.9.0-rc5
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
References: <20200915084302.GG29778@kitsune.suse.cz>
From: Mahesh Jagannath Salgaonkar <mahesh@linux.ibm.com>
Message-ID: <59815d65-34e3-6604-67e3-c510aeb603c4@linux.ibm.com>
Date: Wed, 16 Sep 2020 12:42:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200915084302.GG29778@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_02:2020-09-15,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160047
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/15/20 2:13 PM, Michal Suchánek wrote:
> Hello,
> 
> Using the SLB mutihit injection test module (which I did not write so I
> do not want to post it here) to verify updates on my 5.3 frankernekernel
> I found that the kernel crashes with Oops: kernel bad access.
> 
> I tested on latest upstream kernel build that I have at hand and the
> result is te same (minus the message - nothing was logged and the kernel
> simply rebooted).


Yes, SLB multihit recovery is broken upstream. Fix is on the way.


> 
> Since the whole effort to write a real mode MCE handler was supposed to
> prevent this maybe the SLB injection module should be added to the
> kernel selftests?

Yes. We are working on adding SLB injection selftest patches will be
posted soon.

Thanks,
-Mahesh.

> 
> Thanks
> 
> Michal
> 

