Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78939897
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 00:25:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LHCh1dCfzDr31
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 08:25:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LH9p1gG5zDr2r
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 08:23:41 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x57MM9Xr111420
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Jun 2019 18:23:35 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sywqnxhcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2019 18:23:35 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x57M6kQt020103
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Jun 2019 22:08:43 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 2syxdfrw5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2019 22:08:43 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x57MNWoa26542424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jun 2019 22:23:32 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FE34136011;
 Fri,  7 Jun 2019 22:23:32 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E897F136018;
 Fri,  7 Jun 2019 22:23:31 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.85.229.158])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jun 2019 22:23:31 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: fix oops in hotplug memory notifier
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20190607050407.25444-1-nathanl@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Message-ID: <629a9449-51c3-4c62-0b8c-9008061ee9ee@linux.vnet.ibm.com>
Date: Fri, 7 Jun 2019 15:23:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190607050407.25444-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070146
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

On 06/06/2019 10:04 PM, Nathan Lynch wrote:
> During post-migration device tree updates, we can oops in
> pseries_update_drconf_memory if the source device tree has an
> ibm,dynamic-memory-v2 property and the destination has a
> ibm,dynamic_memory (v1) property. The notifier processes an "update"
> for the ibm,dynamic-memory property but it's really an add in this
> scenario. So make sure the old property object is there before
> dereferencing it.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---

Ok, so I think there are a couple things to address here in regards to the nice
mess PFW has gotten us into.

Yes, this patch solves the oops, but I worry it just papers over some short
comings in our code.

After some poking around unless I'm mistaken our memory notifier only handles v1
versions of the ibm,dynamic-memory property. So, on newer firmware we aren't
doing any memory fixups if v2 (ibm,dynamic-memory-v2) of the property is updated.

For older PFW if we have source and target that only support v1 we will update
the memory in response to any update to ibm,dynamic-memory. It also appears to
be the case if we start with v1 and migrate to a target with newer PFW that
supports both v1 and v2 that the PFW will continue with v1 on the target and as
a result we update memory in accordance to a property update to ibm,dynamic-memory.

Now, if we have source and targets that both support v2 after a migration we
will do no update in response to ibm,dynamic-memory-v2 changes. And then there
is the case of a source with v2 support migrating to a target with only v1
support where we observe this oops. The oops is a result of ibm,dynamic-memory
being a new property that is added and there for no old property date exists.
However, simply returning in response also has the side effect that we do not
update memory in response to a device tree update of dynamic memory.

Maybe we are ok with this behavior as I haven't dug deep enough into the memory
subsystem here to really understand what the memory code is updating, but it is
concerning that we are doing it in some cases, but not all.

-Tyrel

>  arch/powerpc/platforms/pseries/hotplug-memory.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 47087832f8b2..e6bd172bcf30 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -980,6 +980,9 @@ static int pseries_update_drconf_memory(struct of_reconfig_data *pr)
>  	if (!memblock_size)
>  		return -EINVAL;
> 
> +	if (!pr->old_prop)
> +		return 0;
> +
>  	p = (__be32 *) pr->old_prop->value;
>  	if (!p)
>  		return -EINVAL;
> 

