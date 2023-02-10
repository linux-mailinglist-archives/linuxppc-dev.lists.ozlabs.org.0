Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176A692943
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 22:29:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD6MB07Ynz303P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 08:29:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pYVlD6QB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pYVlD6QB;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD6LD2FC7z3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 08:28:51 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31ALHrYB013876;
	Fri, 10 Feb 2023 21:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=i2L7Ia8mK7A5ZkFcCIDcuqRFhX3LFkYSRraV5RpB/N0=;
 b=pYVlD6QBILIm2kSaLn86Yx8Z7cytyyPO+/ivIlFqFyqemYON8IczZAqX3Hsn+jCQpoMp
 rPyWdp6kEP5iX+NRJBmfR4KTE04wtUsUpLj7nlIf1aRqFnCNdnxo8Fz/OlNNQ1ZG7RZ+
 zrpkMtcsbSUWP4LRGjIyDfeQNnSoE47RvB2SG3O5udjiooewWgvCGdw9WUa3X0WS7wmU
 /fOZwkLDJ2NVIxMVJk5zi6HhsLJmgSzpUzvLhI7I61Ri9+K4OdNfVTuEo0iS81VXixPR
 3qb6VfzMmGjCEc26e7vPpsg0FK+zqJzOIFi+56gtNL9TzVWQD1D1+YUKv1dWugoAcKdJ Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnwqf86yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 21:28:46 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31ALNX1M032059;
	Fri, 10 Feb 2023 21:28:45 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnwqf86yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 21:28:45 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31AJ23mu017625;
	Fri, 10 Feb 2023 21:28:44 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3nhf0890g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 21:28:44 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31ALShbT7602810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 21:28:43 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBE8F58054;
	Fri, 10 Feb 2023 21:28:42 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66E6558050;
	Fri, 10 Feb 2023 21:28:41 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 21:28:41 +0000 (GMT)
Message-ID: <a63276d5-1be4-b140-6a4a-4ad4efa60eda@linux.ibm.com>
Date: Fri, 10 Feb 2023 16:28:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 24/26] powerpc/pseries: Implement secvars for dynamic
 secure boot
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
References: <20230210080401.345462-1-ajd@linux.ibm.com>
 <20230210080401.345462-25-ajd@linux.ibm.com>
 <f35e9ba1-5fdb-4cfa-5b41-cc55307dcd45@linux.ibm.com>
In-Reply-To: <f35e9ba1-5fdb-4cfa-5b41-cc55307dcd45@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EAs5PgRdluiiEpYwXP300TK4RVeRSB_e
X-Proofpoint-ORIG-GUID: EUsq-Nrm3brOT4M4ZheaLuvRfA5l5fq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=995 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302100179
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
Cc: gjoyce@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, sudhakar@linux.ibm.com, zohar@linux.ibm.com, ruscur@russell.cc, brking@linux.ibm.com, gcwilson@linux.ibm.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/10/23 16:23, Stefan Berger wrote:
> 
> 

>> +
>> +// PLPKS dynamic secure boot doesn't give us a format string in the same way OPAL does.
>> +// Instead, report the format using the SB_VERSION variable in the keystore.
>> +// The string is made up by us, and takes the form "ibm,plpks-sb-v<n>" (or "ibm,plpks-sb-unknown"
>> +// if the SB_VERSION variable doesn't exist). Hypervisor defines the SB_VERSION variable as a
>> +// "1 byte unsigned integer value".
>> +static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
>> +{
>> +    struct plpks_var var = {0};
>> +    ssize_t ret;
>> +    u8 version;
>> +
>> +    var.component = NULL;
> 
> Since it's initialized with {0} this is not necessary.
> 
>> +    // Only the signed variables have null bytes in their names, this one doesn't
>> +    var.name = "SB_VERSION";
>> +    var.namelen = strlen(var.name);
>> +    var.datalen = 1;
>> +    var.data = &version;
>> +
>> +    // Unlike the other vars, SB_VERSION is owned by firmware instead of the OS
>> +    ret = plpks_read_fw_var(&var);
>> +    if (ret) {
>> +        if (ret == -ENOENT) {
>> +            ret = snprintf(buf, bufsize, "ibm,plpks-sb-unknown");
>> +        } else {
>> +            pr_err("Error %ld reading SB_VERSION from firmware\n", ret);
>> +            ret = -EIO;
>> +        }
>> +        goto err;
>> +    }
>> +
>> +    ret = snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", version);
>> +
>> +err:
>> +    kfree(var.data);
> 
> remove the kfree()

Actually don't remove it but it should probably be

if (var.data != &version)
     kfree(var.data);
> 
>> +    return ret;
>> +}
>> +
