Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 531882D2932
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 11:48:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqxjz4wBHzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 21:48:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lmjuowCD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqxgL4b1szDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 21:46:22 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8AX5r1049836; Tue, 8 Dec 2020 05:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rULsscn17guiHkrbZYXhx/JI4m1eMzaxlJtbbffSHiA=;
 b=lmjuowCDYXzcB5ixJQ60+06wlUF/PGpfNoKQnVMXXkvgg1ENWSEmvezKad/NwEmyE5Ie
 HxDDk8CwtK72NA5lei1QY/VSXdD+y/L3nE4XkKzJ4Ohx668q+Y8MuMXXhoKTmJ7u7svn
 jIDa1r7OTcxM7cArUVB1c/WcjELiDlGOtXp8QLrN+AWknWf68ysI9sCgnlpTtSRiJH8Q
 Fw91AT3TdYDUCbpsuQIHAruFRzprK3Gvl46YkT2xlKgokjkUC1qRfdAXLiz0hjgXK+CX
 NEPSNigd/yLZQw3Ijj2QSXPMo07U9QZJZ8s0soMfwGV0KoIdLX+TAdTjmgR+2JCx9dFt CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359d5pqw04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 05:46:16 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B8AX6AH049889;
 Tue, 8 Dec 2020 05:46:16 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359d5pqvy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 05:46:15 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8AggiZ005142;
 Tue, 8 Dec 2020 10:46:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3581u81s3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 10:46:13 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0B8AkA0q64684312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 10:46:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2D31A405C;
 Tue,  8 Dec 2020 10:46:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 898CDA405B;
 Tue,  8 Dec 2020 10:46:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.77.195.17])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 10:46:09 +0000 (GMT)
Subject: Re: [PATCH] powerpc/mce: Remove per cpu variables from MCE handlers
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20201204102310.76213-1-ganeshgr@linux.ibm.com>
 <871rg0twpw.fsf@mpe.ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <a514db98-6090-467a-74ae-9c7b4337d0c1@linux.ibm.com>
Date: Tue, 8 Dec 2020 16:16:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <871rg0twpw.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_06:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080066
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 12/8/20 4:01 PM, Michael Ellerman wrote:
> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
>> index 9454d29ff4b4..4769954efa7d 100644
>> --- a/arch/powerpc/include/asm/paca.h
>> +++ b/arch/powerpc/include/asm/paca.h
>> @@ -273,6 +274,17 @@ struct paca_struct {
>>   #ifdef CONFIG_MMIOWB
>>   	struct mmiowb_state mmiowb_state;
>>   #endif
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +	int mce_nest_count;
>> +	struct machine_check_event mce_event[MAX_MC_EVT];
>> +	/* Queue for delayed MCE events. */
>> +	int mce_queue_count;
>> +	struct machine_check_event mce_event_queue[MAX_MC_EVT];
>> +
>> +	/* Queue for delayed MCE UE events. */
>> +	int mce_ue_count;
>> +	struct machine_check_event  mce_ue_event_queue[MAX_MC_EVT];
>> +#endif /* CONFIG_PPC_BOOK3S_64 */
>>   } ____cacheline_aligned;
> How much does this expand the paca by?

Size of paca is 4480 bytes, these add up another 2160 bytes, so expands it by 48%.

