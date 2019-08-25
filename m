Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F419C153
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 04:21:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GJlq2fqNzDrRK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 12:21:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GJjw0KFbzDrQ1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 12:19:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46GJjv1p3Kz8syQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 12:19:31 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46GJjv1HJqz9sBp; Sun, 25 Aug 2019 12:19:31 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46GJjs5H2Vz9sBF;
 Sun, 25 Aug 2019 12:19:28 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7P2H8vA071029; Sat, 24 Aug 2019 22:19:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uk1chnna7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 24 Aug 2019 22:19:24 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7P2I9pY072935;
 Sat, 24 Aug 2019 22:19:24 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uk1chnna0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 24 Aug 2019 22:19:24 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7P2Fk5E019438;
 Sun, 25 Aug 2019 02:19:23 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 2ujvv64ywy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Aug 2019 02:19:23 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7P2JN3Y48103776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 25 Aug 2019 02:19:23 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12EF1AE05C;
 Sun, 25 Aug 2019 02:19:23 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3BE3AE05F;
 Sun, 25 Aug 2019 02:19:20 +0000 (GMT)
Received: from [9.80.232.108] (unknown [9.80.232.108])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 25 Aug 2019 02:19:20 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/powernv: Add ultravisor message log interface
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20190823060654.28842-1-cclaudio@linux.ibm.com>
 <87o90g3v5o.fsf@concordia.ellerman.id.au>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Message-ID: <4e577a36-4ce1-410b-3ceb-d31bbf564b3d@linux.ibm.com>
Date: Sat, 24 Aug 2019 23:19:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <87o90g3v5o.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-25_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908250023
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Ryan Grimm <grimm@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/23/19 9:48 AM, Michael Ellerman wrote:
> Hi Claudio,

Hi Michael,

>
> Claudio Carvalho <cclaudio@linux.ibm.com> writes:
>> Ultravisor (UV) provides an in-memory console which follows the OPAL
>> in-memory console structure.
>>
>> This patch extends the OPAL msglog code to also initialize the UV memory
>> console and provide a sysfs interface (uv_msglog) for userspace to view
>> the UV message log.
>>
>> CC: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
>> CC: Oliver O'Halloran <oohall@gmail.com>
>> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> ---
>> This patch depends on the "kvmppc: Paravirtualize KVM to support
>> ultravisor" patchset submitted by Claudio Carvalho.
>> ---
>>  arch/powerpc/platforms/powernv/opal-msglog.c | 99 ++++++++++++++------
>>  1 file changed, 72 insertions(+), 27 deletions(-)
> I think the code changes look mostly OK here.
>
> But I'm not sure about the end result in sysfs.
>
> If I'm reading it right this will create:
>
>  /sys/firmware/opal/uv_msglog
>
> Which I think is a little weird, because the UV is not OPAL.
>
> So I guess I wonder if the file should be created elsewhere to avoid any
> confusion and keep things nicely separated.
>
> Possibly /sys/firmware/ultravisor/msglog ?


Yes, makes sense. I will do that.

Currently, the ultravisor memory console DT property is in
/ibm,opal/ibm,opal-uv-memcons. I think we should move it to
/ibm,ultravisor/ibm,uv-firmware/ibm,uv-memcons. What do you think?

Thanks,
Claudio


>
> cheers
