Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E4EB84E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 21:17:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473xT83kyjzF5VW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 07:17:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kmahlkuc@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473pzR53kmzF5yc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 02:25:07 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9VFHJkZ013962; Thu, 31 Oct 2019 11:24:56 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w01apaj2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 11:24:56 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9VFEnIs026616;
 Thu, 31 Oct 2019 15:24:55 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 2vxwh6mbp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 15:24:55 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9VFOsEm24903974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Oct 2019 15:24:54 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 756DC112067;
 Thu, 31 Oct 2019 15:24:54 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44FB5112065;
 Thu, 31 Oct 2019 15:24:54 +0000 (GMT)
Received: from oc6220003374.ibm.com (unknown [9.40.45.99])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 31 Oct 2019 15:24:54 +0000 (GMT)
Subject: Re: [PATCH v3] drm/radeon: Fix EEH during kexec
To: Michael Ellerman <mpe@ellerman.id.au>, alexander.deucher@amd.com
References: <1572036050-18945-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
 <87o8xyfrmp.fsf@mpe.ellerman.id.au>
From: Kyle Mahlkuch <kmahlkuc@linux.vnet.ibm.com>
Message-ID: <412d6237-d5d7-cd4b-d227-0c84e776fae8@linux.vnet.ibm.com>
Date: Thu, 31 Oct 2019 10:24:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87o8xyfrmp.fsf@mpe.ellerman.id.au>
Content-Type: multipart/alternative;
 boundary="------------1BFA037AD571F71D234D7E5D"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-31_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910310155
X-Mailman-Approved-At: Fri, 01 Nov 2019 07:16:13 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, amd-gfx@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------1BFA037AD571F71D234D7E5D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/19 5:35 AM, Michael Ellerman wrote:

> Hi Kyle,
>
> KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com> writes:
>> From: Kyle Mahlkuch <kmahlkuc@linux.vnet.ibm.com>
>>
>> During kexec some adapters hit an EEH since they are not properly
>> shut down in the radeon_pci_shutdown() function. Adding
>> radeon_suspend_kms() fixes this issue.
>> Enabled only on PPC because this patch causes issues on some other
>> boards.
> Which adapters hit the issues?
>
> And do we know why they're not shut down correctly in
> radeon_pci_shutdown()? That seems like the root cause no?

Hi Michael,
This is hit by the Caicos (edwards2) adapter that I have on ppc. It is not hit
on the Cedar (FirePro) adapter - though I haven't tested this one recently. I'm
not able to test any other adapters. As far as "why", I'm unsure. During
initialization after the kexec we hit an EEH. There could be another point in
the shutdown / start up process where something doesn't get reset correctly.
I'm open to other ideas if you have any.

>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
>> index 9e55076..4528f4d 100644
>> --- a/drivers/gpu/drm/radeon/radeon_drv.c
>> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
>> @@ -379,11 +379,25 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>>   static void
>>   radeon_pci_shutdown(struct pci_dev *pdev)
>>   {
>> +#ifdef CONFIG_PPC64
>> +	struct drm_device *ddev = pci_get_drvdata(pdev);
>> +#endif
> This local serves no real purpose and could be avoided, which would also
> avoid this ifdef.
>
>>   	/* if we are running in a VM, make sure the device
>>   	 * torn down properly on reboot/shutdown
>>   	 */
>>   	if (radeon_device_is_virtual())
>>   		radeon_pci_remove(pdev);
>> +
>> +#ifdef CONFIG_PPC64
>> +	/* Some adapters need to be suspended before a
> AFAIK drm uses normal kernel comment style, so this should be:
>
> 	/*
> 	 * Some adapters need to be suspended before a
>> +	 * shutdown occurs in order to prevent an error
>> +	 * during kexec.
>> +	 * Make this power specific becauase it breaks
>> +	 * some non-power boards.
>> +	 */
>> +	radeon_suspend_kms(ddev, true, true, false);
> ie, instead do:
>
> 	radeon_suspend_kms(pci_get_drvdata(pdev), true, true, false);

I agree, this is a cleaner way to write this patch. I'll update the comment as
well. Thanks for the help.

>> +#endif
>>   }
>>   
>>   static int radeon_pmops_suspend(struct device *dev)
>> -- 
>> 1.8.3.1
> cheers
>

--------------1BFA037AD571F71D234D7E5D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre>
</pre>
    <div class="moz-cite-prefix">
      <pre>On 10/30/19 5:35 AM, Michael Ellerman wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:87o8xyfrmp.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">Hi Kyle,

KyleMahlkuch <a class="moz-txt-link-rfc2396E" href="mailto:kmahlkuc@linux.vnet.ibm.com">&lt;kmahlkuc@linux.vnet.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Kyle Mahlkuch <a class="moz-txt-link-rfc2396E" href="mailto:kmahlkuc@linux.vnet.ibm.com">&lt;kmahlkuc@linux.vnet.ibm.com&gt;</a>

During kexec some adapters hit an EEH since they are not properly
shut down in the radeon_pci_shutdown() function. Adding
radeon_suspend_kms() fixes this issue.
Enabled only on PPC because this patch causes issues on some other
boards.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Which adapters hit the issues?

And do we know why they're not shut down correctly in
radeon_pci_shutdown()? That seems like the root cause no?</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Hi Michael,
This is hit by the Caicos (edwards2) adapter that I have on ppc. It is not hit
on the Cedar (FirePro) adapter - though I haven't tested this one recently. I'm
not able to test any other adapters. As far as "why", I'm unsure. During
initialization after the kexec we hit an EEH. There could be another point in
the shutdown / start up process where something doesn't get reset correctly.
I'm open to other ideas if you have any.

</pre>
    <blockquote type="cite" cite="mid:87o8xyfrmp.fsf@mpe.ellerman.id.au">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 9e55076..4528f4d 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -379,11 +379,25 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 static void
 radeon_pci_shutdown(struct pci_dev *pdev)
 {
+#ifdef CONFIG_PPC64
+	struct drm_device *ddev = pci_get_drvdata(pdev);
+#endif
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This local serves no real purpose and could be avoided, which would also
avoid this ifdef.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	/* if we are running in a VM, make sure the device
 	 * torn down properly on reboot/shutdown
 	 */
 	if (radeon_device_is_virtual())
 		radeon_pci_remove(pdev);
+
+#ifdef CONFIG_PPC64
+	/* Some adapters need to be suspended before a
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
AFAIK drm uses normal kernel comment style, so this should be:

	/*
	 * Some adapters need to be suspended before a
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	 * shutdown occurs in order to prevent an error
+	 * during kexec.
+	 * Make this power specific becauase it breaks
+	 * some non-power boards.
+	 */
+	radeon_suspend_kms(ddev, true, true, false);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
ie, instead do:

	radeon_suspend_kms(pci_get_drvdata(pdev), true, true, false);</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">I agree, this is a cleaner way to write this patch. I'll update the comment as
well. Thanks for the help. 

</pre>
    <blockquote type="cite" cite="mid:87o8xyfrmp.fsf@mpe.ellerman.id.au">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#endif
 }
 
 static int radeon_pmops_suspend(struct device *dev)
-- 
1.8.3.1
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
cheers
</pre>
      <pre>

</pre>
    </blockquote>
  </body>
</html>

--------------1BFA037AD571F71D234D7E5D--

