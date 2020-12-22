Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 951622E0DE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 18:40:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0kBY2T1pzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 04:40:21 +1100 (AEDT)
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
 header.s=pp1 header.b=kaF4LqkX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0k8y3PpXzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 04:38:57 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BMHMY9l144137; Tue, 22 Dec 2020 12:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mzxAJ2qdjDobwjZYtIc9FAiKEaQborbGTrAtKji3Sl4=;
 b=kaF4LqkXSahyPn3BiKIoRWHfIqFMBHf5gtGGlrAcsepsLNhhZ5USsLMdBnHl6WhdUR2L
 qmnz1TY/0qEdNLKUaR5RtCcMyYFjM/+tEjTMJwsS9Jm+QTYl7HZwSR/WAhJR58+oqRzM
 Vg1cdniVcl9hl2jO4OljplJd/Reyh67Q9ym3vfXX6gegTL5UYhSGEioRFvcMBIU6l7Kv
 Kt5+PD2GZ3x+VGQEUEBxCuwybpGJfCV4LlN6noasMdOzpNgL0JecTpzlQEVUl9NocPcV
 xSJDFBFe8oU2mjwpv5YHqF9hLeSGfX5bcN/96uGtoWgfxE7gzvG9tYyVDkDWyqSA4Ary og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35kn510aeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Dec 2020 12:38:51 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BMHOeBK155030;
 Tue, 22 Dec 2020 12:38:51 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35kn510ae9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Dec 2020 12:38:50 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BMHSRDu029108;
 Tue, 22 Dec 2020 17:38:49 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 35kdqy2wym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Dec 2020 17:38:49 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BMHcmrX28770794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Dec 2020 17:38:49 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D32E96A05A;
 Tue, 22 Dec 2020 17:38:48 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C13B6A057;
 Tue, 22 Dec 2020 17:38:47 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.78.58])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 22 Dec 2020 17:38:47 +0000 (GMT)
Subject: Re: [PATCH 3/3] ibmvfc: use correlation token to tag commands
To: Nathan Chancellor <natechancellor@gmail.com>
References: <20201117185031.129939-1-tyreld@linux.ibm.com>
 <20201117185031.129939-3-tyreld@linux.ibm.com>
 <20201222062403.GA2190683@ubuntu-m3-large-x86>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <b71fcc6f-bb07-f02d-8e1e-79fe4f5802dc@linux.ibm.com>
Date: Tue, 22 Dec 2020 09:38:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201222062403.GA2190683@ubuntu-m3-large-x86>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-22_09:2020-12-21,
 2020-12-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012220126
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, james.bottomley@hansenpartnership.com,
 clang-built-linux@googlegroups.com, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/21/20 10:24 PM, Nathan Chancellor wrote:
> On Tue, Nov 17, 2020 at 12:50:31PM -0600, Tyrel Datwyler wrote:
>> The vfcFrame correlation field is 64bit handle that is intended to trace
>> I/O operations through both the client stack and VIOS stack when the
>> underlying physical FC adapter supports tagging.
>>
>> Tag vfcFrames with the associated ibmvfc_event pointer handle.
>>
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>> ---
>>  drivers/scsi/ibmvscsi/ibmvfc.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>> index 0cab4b852b48..3922441a117d 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>> @@ -1693,6 +1693,8 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
>>  		vfc_cmd->iu.pri_task_attr = IBMVFC_SIMPLE_TASK;
>>  	}
>>  
>> +	vfc_cmd->correlation = cpu_to_be64(evt);
>> +
>>  	if (likely(!(rc = ibmvfc_map_sg_data(cmnd, evt, vfc_cmd, vhost->dev))))
>>  		return ibmvfc_send_event(evt, vhost, 0);
>>  
>> @@ -2370,6 +2372,8 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
>>  		tmf->iu.tmf_flags = IBMVFC_ABORT_TASK_SET;
>>  		evt->sync_iu = &rsp_iu;
>>  
>> +		tmf->correlation = cpu_to_be64(evt);
>> +
>>  		init_completion(&evt->comp);
>>  		rsp_rc = ibmvfc_send_event(evt, vhost, default_timeout);
>>  	}
>> -- 
>> 2.27.0
>>
> 
> This patch introduces a clang warning, is this intentional behavior?

Nope, I just missed the required cast. I've got a fixes patch queued up. I just
haven't sent it yet.

-Tyrel

