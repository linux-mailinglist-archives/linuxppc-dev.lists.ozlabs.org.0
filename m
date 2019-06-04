Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D78793510B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 22:34:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JNvF2pnvzDqLT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 06:34:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JNsy4dcZzDq7c
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 06:33:26 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x54KWcCY026803; Tue, 4 Jun 2019 16:33:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sww18y1bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2019 16:33:21 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x54KWecw026896;
 Tue, 4 Jun 2019 16:33:21 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sww18y1bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2019 16:33:21 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x54KQEa2025785;
 Tue, 4 Jun 2019 20:30:28 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 2swybxr2mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2019 20:30:28 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x54KXHRx14418390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jun 2019 20:33:17 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5765D136055;
 Tue,  4 Jun 2019 20:33:17 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83F4513605E;
 Tue,  4 Jun 2019 20:33:15 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.215.159])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jun 2019 20:33:15 +0000 (GMT)
Subject: Re: [WIP RFC PATCH 0/6] Generic Firmware Variable Filesystem
To: Greg KH <gregkh@linuxfoundation.org>, Daniel Axtens <dja@axtens.net>
References: <20190520062553.14947-1-dja@axtens.net>
 <316a0865-7e14-b36a-7e49-5113f3dfc35f@linux.vnet.ibm.com>
 <87zhmzxkzz.fsf@dja-thinkpad.axtens.net> <20190603072916.GA7545@kroah.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <90d3394f-c2e6-5d47-0ebd-0ddb28f3f883@linux.vnet.ibm.com>
Date: Tue, 4 Jun 2019 16:33:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190603072916.GA7545@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-04_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906040130
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
Cc: nayna@linux.ibm.com, cclaudio@linux.ibm.com,
 Mimi Zohar <zohar@linux.ibm.com>, George Wilson <gcwilson@us.ibm.com>,
 Matthew Garrett <mjg59@google.com>, Elaine Palmer <erpalmer@us.ibm.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/03/2019 03:29 AM, Greg KH wrote:
> On Mon, Jun 03, 2019 at 04:04:32PM +1000, Daniel Axtens wrote:
>> Hi Nayna,
>>
>>>> As PowerNV moves towards secure boot, we need a place to put secure
>>>> variables. One option that has been canvassed is to make our secure
>>>> variables look like EFI variables. This is an early sketch of another
>>>> approach where we create a generic firmware variable file system,
>>>> fwvarfs, and an OPAL Secure Variable backend for it.
>>> Is there a need of new filesystem ? I am wondering why can't these be
>>> exposed via sysfs / securityfs ?
>>> Probably, something like... /sys/firmware/secureboot or
>>> /sys/kernel/security/secureboot/  ?
>> I suppose we could put secure variables in sysfs, but I'm not sure
>> that's what sysfs was intended for. I understand sysfs as "a
>> filesystem-based view of kernel objects" (from
>> Documentation/filesystems/configfs/configfs.txt), and I don't think a
>> secure variable is really a kernel object in the same way most other
>> things in sysfs are... but I'm open to being convinced.
> What makes them more "secure" than anything else that is in sysfs today?
> I didn't see anything in this patchset that provided "additional
> security", did I miss it?
>
>> securityfs seems to be reserved for LSMs, I don't think we can put
>> things there.
> Yeah, I wouldn't mess with that.

Thanks Greg for clarifying!! I am curious, the TPM exposes the BIOS event log to userspace via securityfs. Is there a reason for not exposing these security variables to userspace via securityfs as well?

Thanks & Regards,
    - Nayna

