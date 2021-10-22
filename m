Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D7C437F41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 22:17:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbbHW5pqyz3cTZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 07:17:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZR9FvGYE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZR9FvGYE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbbGh6s59z2ywK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 07:16:44 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19MJa915001757; 
 Fri, 22 Oct 2021 16:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fLxcPs/gVqZ3EB9hMDQP1ukHCaAJzVmw7T9hX1rclW4=;
 b=ZR9FvGYEaEY96meqi64Lj25iooAI8Upij3lP+mVTA5WQ/rbSFeScO+0urPkz+pk2kQXZ
 2TR0ynNGzGnbn9WxlY1UEJC53C8nenExZl4jbv8/WLd0BtcsISeQbjuQgE5H/fm0gjMv
 COFTB2kUgsN5s7gDDlm/njYzCBf5p4IOLgK1uYjskYGrTfKUhluegiygjaCSf+B9hHMA
 aKUuQNCcWlB7hx5HGVpV+WP1VMVvgBr/MuhB+aCWeZDhkNb6ECwCf7ZqgfmoerXHkZi/
 VUmcmyDIFufws5h/GA0v3YwwSpd1wnscyKjz9RLhP46FNQjFct01SdW0bxbfAL9H1hXG Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bv090vqk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 16:16:35 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19MJd1Gi015407;
 Fri, 22 Oct 2021 16:16:35 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bv090vqjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 16:16:34 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19MKDXTI025004;
 Fri, 22 Oct 2021 20:16:34 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 3bqpcdae57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 20:16:34 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19MKGXoT23986880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Oct 2021 20:16:33 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CC58C6062;
 Fri, 22 Oct 2021 20:16:33 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E555EC6059;
 Fri, 22 Oct 2021 20:16:31 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.235.71])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 22 Oct 2021 20:16:31 +0000 (GMT)
Subject: Re: [PATCH] soc: fsl: guts: Fix a resource leak in the error handling
 path of 'fsl_guts_probe()'
To: Li Yang <leoyang.li@nxp.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <b12e8c5c5d6ab3061d9504de8fbaefcad6bbc385.1629321668.git.christophe.jaillet@wanadoo.fr>
 <CADRPPNTHKuV9eernJS6ZV_+i-xtPXHQnS64GSx=ubwWE+nbLYw@mail.gmail.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <20ecf373-75a4-97e5-baa4-24b8871da546@linux.ibm.com>
Date: Fri, 22 Oct 2021 13:16:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNTHKuV9eernJS6ZV_+i-xtPXHQnS64GSx=ubwWE+nbLYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4SkIfNjXn18qq5OWPBGKLyHa4-7xsXiC
X-Proofpoint-GUID: 21GsyBi8kItp1nP8a2ioOYBPadBw0bqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_05,2021-10-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110220112
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 kernel-janitors@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/21/21 5:26 PM, Li Yang wrote:
> On Wed, Aug 18, 2021 at 4:23 PM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> If an error occurs after 'of_find_node_by_path()', the reference taken for
>> 'root' will never be released and some memory will leak.
> 
> Thanks for finding this.  This truly is a problem.
> 
>>
>> Instead of adding an error handling path and modifying all the
>> 'return -SOMETHING' into 'goto errorpath', use 'devm_add_action_or_reset()'
>> to release the reference when needed.
>>
>> Simplify the remove function accordingly.
>>
>> As an extra benefit, the 'root' global variable can now be removed as well.
>>
>> Fixes: 3c0d64e867ed ("soc: fsl: guts: reuse machine name from device tree")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested only
>> ---
>>  drivers/soc/fsl/guts.c | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
>> index d5e9a5f2c087..4d9476c7b87c 100644
>> --- a/drivers/soc/fsl/guts.c
>> +++ b/drivers/soc/fsl/guts.c
>> @@ -28,7 +28,6 @@ struct fsl_soc_die_attr {
>>  static struct guts *guts;
>>  static struct soc_device_attribute soc_dev_attr;
>>  static struct soc_device *soc_dev;
>> -static struct device_node *root;
>>
>>
>>  /* SoC die attribute definition for QorIQ platform */
>> @@ -136,14 +135,23 @@ static u32 fsl_guts_get_svr(void)
>>         return svr;
>>  }
>>
>> +static void fsl_guts_put_root(void *data)
>> +{
>> +       struct device_node *root = data;
>> +
>> +       of_node_put(root);
>> +}
>> +
>>  static int fsl_guts_probe(struct platform_device *pdev)
>>  {
>>         struct device_node *np = pdev->dev.of_node;
>>         struct device *dev = &pdev->dev;
>> +       struct device_node *root;
>>         struct resource *res;
>>         const struct fsl_soc_die_attr *soc_die;
>>         const char *machine;
>>         u32 svr;
>> +       int ret;
>>
>>         /* Initialize guts */
>>         guts = devm_kzalloc(dev, sizeof(*guts), GFP_KERNEL);
>> @@ -159,6 +167,10 @@ static int fsl_guts_probe(struct platform_device *pdev)
>>
>>         /* Register soc device */
>>         root = of_find_node_by_path("/");
>> +       ret = devm_add_action_or_reset(dev, fsl_guts_put_root, root);
>> +       if (ret)
>> +               return ret;
> 
> We probably only need to hold the reference when we do get "machine"
> from the device tree, otherwise we can put it directly.

To be pedantic since you are using the a properties string value of the root
node directly you need to hold the reference of that node for the lifetime of
the device. Realistically, its not like the root node and its model/compatible
properties are going to need to get modified at runtime so you could also argue
that holding the reference is unnecessary.

> 
> Or maybe we just maintain a local copy of string machine which means
> we can release the reference right away?

Looks like that is the original behavior that commit 3c0d64e867ed changed.
Although it looks like that behavior neglected to handle a memory allocation
failure during the string copy. How much memory is really being saved by not
keeping a local copy? Maybe revert 3c0d64e867ed and add the memory allocation check?

-Tyrel

> 
>> +
>>         if (of_property_read_string(root, "model", &machine))
>>                 of_property_read_string_index(root, "compatible", 0, &machine);
>>         if (machine)
>> @@ -197,7 +209,7 @@ static int fsl_guts_probe(struct platform_device *pdev)
>>  static int fsl_guts_remove(struct platform_device *dev)
>>  {
>>         soc_device_unregister(soc_dev);
>> -       of_node_put(root);
>> +
>>         return 0;
>>  }
>>
>> --
>> 2.30.2
>>

