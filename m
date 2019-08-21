Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 533F5971A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 07:38:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CxKf02pPzDr5L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 15:38:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anju@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CxJ46mQKzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 15:37:23 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7L5Xv4I115459
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 01:37:20 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ugy509wkx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 01:37:19 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Wed, 21 Aug 2019 06:37:17 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 21 Aug 2019 06:37:17 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7L5bGPZ58392622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 05:37:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00095A4066;
 Wed, 21 Aug 2019 05:37:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 816DCA405F;
 Wed, 21 Aug 2019 05:37:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.72])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 21 Aug 2019 05:37:15 +0000 (GMT)
Subject: Re: [PATCH] platform/powernv: Avoid re-registration of imc debugfs
 directory
To: "Oliver O'Halloran" <oohall@gmail.com>
References: <20190821040935.13071-1-anju@linux.vnet.ibm.com>
 <CAOSf1CGj1k3nmfBYp9-TWo+V4sbLRXBcFzrbq25hm2YWtW4MWA@mail.gmail.com>
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Date: Wed, 21 Aug 2019 11:07:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOSf1CGj1k3nmfBYp9-TWo+V4sbLRXBcFzrbq25hm2YWtW4MWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19082105-0020-0000-0000-00000361F9A8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082105-0021-0000-0000-000021B72D8D
Message-Id: <94672ed1-59fc-3a51-658d-364481418d8c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210060
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 8/21/19 10:16 AM, Oliver O'Halloran wrote:
> On Wed, Aug 21, 2019 at 2:10 PM Anju T Sudhakar <anju@linux.vnet.ibm.com> wrote:
>> export_imc_mode_and_cmd() function which creates the debugfs interface for
>> imc-mode and imc-command, is invoked when each nest pmu units is
>> registered.
>> When the first nest pmu unit is registered, export_imc_mode_and_cmd()
>> creates 'imc' directory under `/debug/powerpc`. In the subsequent
>> invocations debugfs_create_dir() function returns, since the directory
>> already exists.
>>
>> The recent commit <c33d442328f55> (debugfs: make error message a bit more
>> verbose), throws a warning if we try to invoke `debugfs_create_dir()`
>> with an already existing directory name.
>>
>> Address this warning by lookup for an existing 'imc' directory,
>> and do not invoke debugfs_create_dir(), if the debugfs interface for
>> imc already exists.
>>
>> This patch is based on:
>>     https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-July/192979.html
>>
>> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>> Tested-by: Nageswara R Sastry <rnsastry@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/platforms/powernv/opal-imc.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
>> index e04b20625cb9..fc2f0e60a44d 100644
>> --- a/arch/powerpc/platforms/powernv/opal-imc.c
>> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
>> @@ -55,14 +55,19 @@ static void export_imc_mode_and_cmd(struct device_node *node,
>>          static u64 loc, *imc_mode_addr, *imc_cmd_addr;
>>          char mode[16], cmd[16];
>>          u32 cb_offset;
>> +       struct dentry *dir = NULL;
>>          struct imc_mem_info *ptr = pmu_ptr->mem_info;
>>
>> +
>> +       /* Return, if 'imc' interface already exists */
>> +       dir = debugfs_lookup("imc", powerpc_debugfs_root);
>> +       if (dir) {
>> +               dput(dir);
>> +               return;
>> +       }
>>          imc_debugfs_parent = debugfs_create_dir("imc", powerpc_debugfs_root);
> Is there a reason why we create the debugfs directory here and not in
> opal_imc_counters_probe()? There's logic to remove the debugfs
> directory in _probe() already so it seems like a more natural place to
> it.
>
Good point. But we can only create the parent directory,

i.e 'imc' directory in `_probe()` function and the entries can be

created only here. The reason is, this debugfs entries are only for

IMC nest units. So, to get the imc mode and command values from

the nest memory region we need the relevant offsets from the control 
block structure.

Since imc_get_mem_addr_nest() function reads this address

for each chip, we invoke the function to create the debugfs

entries after this values are populated(i.e export_imc_mode_and_cmd() in 
invoked by

imc_get_mem_addr_nest()).

Also, if we create the parent directory in `_probe()` function,

we need to track whether the entries(i.e imc_cmd and imc_mode) are 
created or not.


Regards,

Anju

