Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5223B7BB97A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 15:44:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f8L2W4xm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S28mv1tYfz3vc0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 00:44:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f8L2W4xm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S28m21w5rz3cc6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 00:44:02 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396DgJ55028499;
	Fri, 6 Oct 2023 13:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=j/AG//P4Bx8htSBN1sllurmbbh6m4O61QdheH9XyQaA=;
 b=f8L2W4xmLnh9vrnf3oJjjE6fMCcxcy6YADrkJQxhSTb4k8ZsYQkKNPhE9X7kMyg59Me5
 V/anx27NmkmfFcuzUWp3UPqSP2GtZSZ984sC1NPxt6Pss8B0+O4viDb7EbVU7JYUTNiq
 WS3IvVf2DndRoZb+xV7exE8ocXykH9o3EjdFe21DjpkwOwdRxbEJV1KAwDGYIN8kLqP1
 T2K9S+SY8ROmhsSIWd4ADVW6dwmWCAm14WrQ0fuEb5GK9kZuKtvGTPuSZic8dZb8yXHw
 RqZXih3huY3ikXl4GUS0AMmuieNyxEl7hebQT7E0BkG+8N9ThWlstHQJmuFZHfcNW3qV lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjkbur0ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 13:43:46 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 396DhkaY031843;
	Fri, 6 Oct 2023 13:43:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjkbur0ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 13:43:46 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396DE2OL007467;
	Fri, 6 Oct 2023 13:43:45 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3teygmvh0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 13:43:43 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396DhgjK32309528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 13:43:42 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C0B45805D;
	Fri,  6 Oct 2023 13:43:42 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24F5158057;
	Fri,  6 Oct 2023 13:43:36 +0000 (GMT)
Received: from [9.171.83.242] (unknown [9.171.83.242])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 13:43:35 +0000 (GMT)
Message-ID: <357397b0-8e87-dd88-7c47-fb457cc7e830@linux.vnet.ibm.com>
Date: Fri, 6 Oct 2023 19:13:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Bisected] [commit 2ad56efa80db] [Hotplug] WARNING while
 performing hotplug operation on 6.6-rc3-next
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <92db426f-4a31-9c2c-e23a-85a8d353fbae@linux.vnet.ibm.com>
 <20231006113644.GN682044@nvidia.com>
 <7ce42090-a768-ba3d-bd27-e86bc076ee57@linux.vnet.ibm.com>
 <20231006133936.GQ682044@nvidia.com>
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
In-Reply-To: <20231006133936.GQ682044@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nLE4iNGHcLJosVYVMuO3-4ONDA7DFVRp
X-Proofpoint-ORIG-GUID: fYOvrWE8LP4wm9SFS9pp8cLPXlA9fRkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_11,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=977
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060101
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
Cc: sachinp@linux.vnet.com, jroedel@suse.de, will@kernel.org, linux-arm-msm@vger.kernel.org, joro@8bytes.org, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, abdhalee@linux.vnet.ibm.com, iommu@lists.linux.dev, linux-next@vger.kernel.org, mputtash@linux.vnet.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Jason for confirmation and the fix.

On 10/6/23 19:09, Jason Gunthorpe wrote:
> On Fri, Oct 06, 2023 at 06:50:00PM +0530, Tasmiya Nalatwad wrote:
>>     Greetings,
>>
>>     Thanks Jason.
>>
>>     The fix provided by you works. It is not giving WARNING's but i am
>>     seeing below logs. Would you please confirm on the logs.
> I don't know anything about your environment but those logs don't
> appear to be related to this series?
>
> Jason

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

