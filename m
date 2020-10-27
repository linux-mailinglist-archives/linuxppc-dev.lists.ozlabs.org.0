Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D35529CB96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 22:54:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLQV45jRczDqP3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 08:54:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RcKrCnQF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLQR763FKzDqNy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 08:52:18 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09RLYf95097976; Tue, 27 Oct 2020 17:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Z2oTYETLVeUyyEXJSIeR3dyBMOi2hnxHWzwwqVREkyI=;
 b=RcKrCnQFkoOMNre1JTffqI0ApT6ghHeCTKZgIumMgWGPykSi20cuYY3d8gULdiphv686
 alI1rfIhizEdgA+a9AxyI/MQXCl7qem0vPH32XA+LKoJTzPvZuIWhS4OLH7y0uKGiHje
 VJW2lmMSSYcYQd/M6IBgdIH5/pbB1PtkezU71WEuKsir1kgHLgbVJrxVMZt8o3YbtReX
 VjcFr0lLmIb9E4f0dzQdtxa5J94KJpqeQUQzLW3C5J8ZDjluirAcxZ2Q0G/Jp8A6d46O
 XVNMNOzipXUtehEzn4yEKpbK1WPVW6NgUhOOxMI+gUMA2WkWZZEntagFASJGFB+w6kjz 6Q== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34e4jwqw8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Oct 2020 17:52:14 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09RLpbpD009936;
 Tue, 27 Oct 2020 21:52:13 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 34cbw9b533-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Oct 2020 21:52:13 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09RLqCFC49348918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Oct 2020 21:52:12 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11E8BC6057;
 Tue, 27 Oct 2020 21:52:12 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E40DDC6055;
 Tue, 27 Oct 2020 21:52:10 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.55.172])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 27 Oct 2020 21:52:10 +0000 (GMT)
Subject: Re: [PATCH] ibmvfc: add new fields for version 2 of several MADs
To: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20201026013649.10147-1-tyreld@linux.ibm.com>
 <yq1v9ew4ekf.fsf@ca-mkp.ca.oracle.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <c94f0f87-1863-9c0a-3561-4cbc9330e011@linux.ibm.com>
Date: Tue, 27 Oct 2020 14:52:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <yq1v9ew4ekf.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-27_15:2020-10-26,
 2020-10-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270125
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
Cc: james.bottomley@hansenpartnership.com, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/26/20 6:56 PM, Martin K. Petersen wrote:
> 
> Tyrel,
> 
>> Introduce a targetWWPN field to several MADs. Its possible that a scsi
>> ID of a target can change due to some fabric changes. The WWPN of the
>> scsi target provides a better way to identify the target. Also, add
>> flags for receiving MAD versioning information and advertising client
>> support for targetWWPN with the VIOS. This latter capability flag will
>> be required for future clients capable of requesting multiple hardware
>> queues from the host adapter.
> 
> Applied to 5.11/scsi-staging, thanks!
> 

Hi Martin,

I'm going to have to ask that this patch be unstaged.

After some clarification from our VIOS folks I made the assumption that the MAD
size was staying the same and new fields just used up existing reserved padding.
Turns out they chose to keep the same amount of padding increasing the size of
those structures. So, this patch needs to be reworked.

Sorry about that,

-Tyrel
