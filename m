Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8140226C2E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 14:44:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs0Cn5jTNzDqRk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 22:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VXsecECl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs09d3mfWzDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 22:42:28 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GCXRn6058426; Wed, 16 Sep 2020 08:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PHmzFkuHlJWCB1nF/p+CXC+ip4WF97xYqq0N19t1ats=;
 b=VXsecECliMgVo3zmw/z8KwiGm3l4WuxO3Rrh+ZpsmrP51gnoZMdgj1khOYmZ1fU+ZuK6
 3z4OPzoLuuxyUqAZKCsgULbl90MiEQdfVXn7ljvLQ5GUIWyj+GGdV66IPTGllA1DOzLe
 fRzj8oEu5tvL/JSoy8uIPeG8vFF5LkoboAMqRRPW0Yh0bHc1d0dTFTD821LTO0oQs3+O
 XYl1f2Ke5kvTPSq2iUbO/KIUfC4MJ6eMbPym+gjyMcB0bBHQsela6xkyuCSbl+DVWRJk
 FPk5LVaIBsAibUWXxmY/khBIOfX8fyquchll65gC5ucqy5RegrJMLJu3zjK1L9cB9wbM DQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33kjmgghw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 08:42:26 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08GCWGT4030746;
 Wed, 16 Sep 2020 12:42:24 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 33k658nnxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 12:42:24 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08GCgNuE29753612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 12:42:23 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B6EA136051;
 Wed, 16 Sep 2020 12:42:23 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5F7613604F;
 Wed, 16 Sep 2020 12:42:22 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.160.112.131])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Sep 2020 12:42:22 +0000 (GMT)
Subject: Re: [PATCH] ibmvfc: Avoid link down on FS9100 canister reboot
To: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <1599859706-8505-1-git-send-email-brking@linux.vnet.ibm.com>
 <yq1o8m61r87.fsf@ca-mkp.ca.oracle.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <530af937-2f42-4bc5-a00c-4c236656c7fa@linux.vnet.ibm.com>
Date: Wed, 16 Sep 2020 07:42:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <yq1o8m61r87.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_07:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=975
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160094
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
Cc: tyreld@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/15/20 7:49 PM, Martin K. Petersen wrote:
> 
> Brian,
> 
>> When a canister on a FS9100, or similar storage, running in NPIV mode,
>> is rebooted, its WWPNs will fail over to another canister.
> 
> [...]
> 
> Applied to 5.10/scsi-staging, thanks! I fixed a bunch of checkpatch
> warnings.

Sorry about the checkpatch issues. Thanks for pulling this in.

-Brian

-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

