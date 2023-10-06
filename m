Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC0F7BCA6F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 01:37:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ghst8dG0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S31tT3G1dz3dng
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 10:37:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ghst8dG0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S28L16JFCz3cSJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 00:24:57 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396D2MwY015236;
	Fri, 6 Oct 2023 13:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=pp1; bh=L+T6lFE7JWTCY6TXOpkbAgUgnwrpwuwEf+ukjzpnwKs=;
 b=Ghst8dG0yoT5K1Pt1pWhwrxXd51UgcFdassplpw88sA6Of/1zmk5DT9oCQUqFCYo5nSN
 9osg0I4uutPkl8arCgP3WJFVnI9Kt83xChjhS8ye0JOTDXLcuEvSKtHjf7PNH2rKL50w
 MeOQTLOJtULwWMdWLgc66SfUW7Yd38EnIbEbF5dUGgscMZ3iqW1vYb394o13AyO0+xOK
 N/WVQgrMzffAJfMSzb/K7/FmyQz6hTuMUCAYPcpv6o8tSLrr+bBmrD5Bqj4V7fQ3YwML
 WNxb6dux2u/KN2vEIbl+vOyJzsA+ISaXrLyeiQLHEkiKiaGgJKN/uyjSMcwnFAHPP/aL dA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjjs28qnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 13:24:28 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 396DA2Mc011833;
	Fri, 6 Oct 2023 13:24:20 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjjs28pvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 13:24:20 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396CtOg0005868;
	Fri, 6 Oct 2023 13:22:11 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tex0u4chs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 13:22:11 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396DK8in62914976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 13:20:08 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0135D58067;
	Fri,  6 Oct 2023 13:20:08 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CC4358062;
	Fri,  6 Oct 2023 13:20:02 +0000 (GMT)
Received: from [9.171.83.242] (unknown [9.171.83.242])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 13:20:01 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------yfix7TZyBa6O9vu3Xq2dxoEP"
Message-ID: <7ce42090-a768-ba3d-bd27-e86bc076ee57@linux.vnet.ibm.com>
Date: Fri, 6 Oct 2023 18:50:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Bisected] [commit 2ad56efa80db] [Hotplug] WARNING while
 performing hotplug operation on 6.6-rc3-next
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <92db426f-4a31-9c2c-e23a-85a8d353fbae@linux.vnet.ibm.com>
 <20231006113644.GN682044@nvidia.com>
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
In-Reply-To: <20231006113644.GN682044@nvidia.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KkzaBFMvirpzS_twIfSTN_9PJJ-DUN4T
X-Proofpoint-ORIG-GUID: uEPdQtd5QCNkF2o_QrTpOrkwjwFTeE-W
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_10,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxlogscore=941 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060099
X-Mailman-Approved-At: Sun, 08 Oct 2023 10:36:54 +1100
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
Cc: sachinp@linux.vnet.com, jroedel@suse.de, will@kernel.org, linux-arm-msm@vger.kernel.org, joro@8bytes.org, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, abdhalee@linux.vnet.ibm.com, iommu@lists.linux.dev, linux-next@vger.kernel.org, mputtash@linux.vnet.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------yfix7TZyBa6O9vu3Xq2dxoEP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Greetings,

Thanks Jason.

The fix provided by you works. It is not giving WARNING's but i am 
seeing below logs. Would you please confirm on the logs.

https://lore.kernel.org/all/0-v1-2b52423411b9+164fc-iommu_ppc_defdomain_jgg@nvidia.com/

[  152.342125] pci 0013:60:00.0: No hypervisor support for SR-IOV on 
this device, IOV BARs disabled.
[  152.344896] pci 0013:60:00.0: PME# supported from D0 D3hot D3cold
[  152.348936] pci 0013:60:00.0: Adding to iommu group 0
[  152.349944] pci 0013:60:00.1: No hypervisor support for SR-IOV on 
this device, IOV BARs disabled.
[  152.352701] pci 0013:60:00.1: PME# supported from D0 D3hot D3cold
[  152.356520] pci 0013:60:00.1: Adding to iommu group 0
[  152.356527] iommu_tce: it_map is not empty
[  152.357501] pci 0013:60:00.2: No hypervisor support for SR-IOV on 
this device, IOV BARs disabled.
[  152.360247] pci 0013:60:00.2: PME# supported from D0 D3hot D3cold
[  152.364070] pci 0013:60:00.2: Adding to iommu group 0
[  152.364075] *iommu_tce: it_map is not empty*
[  152.365043] pci 0013:60:00.3: No hypervisor support for SR-IOV on 
this device, IOV BARs disabled.
[  152.367790] pci 0013:60:00.3: PME# supported from D0 D3hot D3cold
[  152.371635] pci 0013:60:00.3: Adding to iommu group 0
[  152.371641] iommu_tce: it_map is not empty
[  152.371720] pci 0013:60:00.0: of_irq_parse_pci: no interrupt-map 
found, INTx interrupts not available
[  152.408351] tg3 0013:60:00.0: iommu: 64-bit OK but direct DMA is 
limited by 800002000000000
[  152.408376] tg3 0013:60:00.0: iommu: 64-bit OK but direct DMA is 
limited by 800002000000000
*[  152.408404] tg3 0013:60:00.0: DMA engine test failed, aborting**
**[  152.408557] tg3: probe of 0013:60:00.0 failed with error -12*
[  152.408583] pci 0013:60:00.1: Adding to iommu group 0
[  152.408589] iommu_tce: it_map is not empty
[  152.408656] pci 0013:60:00.1: of_irq_parse_pci: no interrupt-map 
found, INTx interrupts not available
[  152.448321] tg3 0013:60:00.1: iommu: 64-bit OK but direct DMA is 
limited by 800002000000000
[  152.448339] tg3 0013:60:00.1: iommu: 64-bit OK but direct DMA is 
limited by 800002000000000
[  152.448360] tg3 0013:60:00.1: DMA engine test failed, aborting
[  152.448497] tg3: probe of 0013:60:00.1 failed with error -12
[  152.448519] pci 0013:60:00.2: Adding to iommu group 0
[  152.448525] iommu_tce: it_map is not empty
[  152.448586] pci 0013:60:00.2: of_irq_parse_pci: no interrupt-map 
found, INTx interrupts not available
[  152.488323] tg3 0013:60:00.2: iommu: 64-bit OK but direct DMA is 
limited by 800002000000000
[  152.488340] tg3 0013:60:00.2: iommu: 64-bit OK but direct DMA is 
limited by 800002000000000
[  152.488362] tg3 0013:60:00.2: DMA engine test failed, aborting
[  152.488495] tg3: probe of 0013:60:00.2 failed with error -12
[  152.488516] pci 0013:60:00.3: Adding to iommu group 0
[  152.488523] iommu_tce: it_map is not empty
[  152.488581] pci 0013:60:00.3: of_irq_parse_pci: no interrupt-map 
found, INTx interrupts not available
[  152.528342] tg3 0013:60:00.3: iommu: 64-bit OK but direct DMA is 
limited by 800002000000000
[  152.528359] tg3 0013:60:00.3: iommu: 64-bit OK but direct DMA is 
limited by 800002000000000
[  152.528381] tg3 0013:60:00.3: DMA engine test failed, aborting
[  152.528515] tg3: probe of 0013:60:00.3 failed with error -12

On 10/6/23 17:06, Jason Gunthorpe wrote:
> On Fri, Oct 06, 2023 at 01:20:17PM +0530, Tasmiya Nalatwad wrote:
>> Greetings,
>>
>> [linux-next] [6.6.0-rc3-next-20230929] WARNING: CPU: 5 PID: 185612 at
>> drivers/iommu/iommu.c:3049  iommu_setup_default_domain+0x410/0x680
>>
>> --- Traces ---
>>
>> [ 6296.425934] WARNING: CPU: 5 PID: 185612 at drivers/iommu/iommu.c:3049
>> iommu_setup_default_domain+0x410/0x680
> Does this fix it too? I think it should?
>
> https://lore.kernel.org/r/0-v1-2b52423411b9+164fc-iommu_ppc_defdomain_jgg@nvidia.com
>
> Jason

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

--------------yfix7TZyBa6O9vu3Xq2dxoEP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Greetings,</p>
    <p>Thanks Jason. <br>
    </p>
    <p>The fix provided by you works. It is not giving WARNING's but i
      am seeing below logs. Would you please confirm on the logs.<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/0-v1-2b52423411b9+164fc-iommu_ppc_defdomain_jgg@nvidia.com/">https://lore.kernel.org/all/0-v1-2b52423411b9+164fc-iommu_ppc_defdomain_jgg@nvidia.com/</a></p>
    <p>[  152.342125] pci 0013:60:00.0: No hypervisor support for SR-IOV
      on this device, IOV BARs disabled.<br>
      [  152.344896] pci 0013:60:00.0: PME# supported from D0 D3hot
      D3cold<br>
      [  152.348936] pci 0013:60:00.0: Adding to iommu group 0<br>
      [  152.349944] pci 0013:60:00.1: No hypervisor support for SR-IOV
      on this device, IOV BARs disabled.<br>
      [  152.352701] pci 0013:60:00.1: PME# supported from D0 D3hot
      D3cold<br>
      [  152.356520] pci 0013:60:00.1: Adding to iommu group 0<br>
      [  152.356527] iommu_tce: it_map is not empty<br>
      [  152.357501] pci 0013:60:00.2: No hypervisor support for SR-IOV
      on this device, IOV BARs disabled.<br>
      [  152.360247] pci 0013:60:00.2: PME# supported from D0 D3hot
      D3cold<br>
      [  152.364070] pci 0013:60:00.2: Adding to iommu group 0<br>
      [  152.364075] <b>iommu_tce: it_map is not empty</b><br>
      [  152.365043] pci 0013:60:00.3: No hypervisor support for SR-IOV
      on this device, IOV BARs disabled.<br>
      [  152.367790] pci 0013:60:00.3: PME# supported from D0 D3hot
      D3cold<br>
      [  152.371635] pci 0013:60:00.3: Adding to iommu group 0<br>
      [  152.371641] iommu_tce: it_map is not empty<br>
      [  152.371720] pci 0013:60:00.0: of_irq_parse_pci: no
      interrupt-map found, INTx interrupts not available<br>
      [  152.408351] tg3 0013:60:00.0: iommu: 64-bit OK but direct DMA
      is limited by 800002000000000<br>
      [  152.408376] tg3 0013:60:00.0: iommu: 64-bit OK but direct DMA
      is limited by 800002000000000<br>
      <b>[  152.408404] tg3 0013:60:00.0: DMA engine test failed,
        aborting</b><b><br>
      </b><b>[  152.408557] tg3: probe of 0013:60:00.0 failed with error
        -12</b><br>
      [  152.408583] pci 0013:60:00.1: Adding to iommu group 0<br>
      [  152.408589] iommu_tce: it_map is not empty<br>
      [  152.408656] pci 0013:60:00.1: of_irq_parse_pci: no
      interrupt-map found, INTx interrupts not available<br>
      [  152.448321] tg3 0013:60:00.1: iommu: 64-bit OK but direct DMA
      is limited by 800002000000000<br>
      [  152.448339] tg3 0013:60:00.1: iommu: 64-bit OK but direct DMA
      is limited by 800002000000000<br>
      [  152.448360] tg3 0013:60:00.1: DMA engine test failed, aborting<br>
      [  152.448497] tg3: probe of 0013:60:00.1 failed with error -12<br>
      [  152.448519] pci 0013:60:00.2: Adding to iommu group 0<br>
      [  152.448525] iommu_tce: it_map is not empty<br>
      [  152.448586] pci 0013:60:00.2: of_irq_parse_pci: no
      interrupt-map found, INTx interrupts not available<br>
      [  152.488323] tg3 0013:60:00.2: iommu: 64-bit OK but direct DMA
      is limited by 800002000000000<br>
      [  152.488340] tg3 0013:60:00.2: iommu: 64-bit OK but direct DMA
      is limited by 800002000000000<br>
      [  152.488362] tg3 0013:60:00.2: DMA engine test failed, aborting<br>
      [  152.488495] tg3: probe of 0013:60:00.2 failed with error -12<br>
      [  152.488516] pci 0013:60:00.3: Adding to iommu group 0<br>
      [  152.488523] iommu_tce: it_map is not empty<br>
      [  152.488581] pci 0013:60:00.3: of_irq_parse_pci: no
      interrupt-map found, INTx interrupts not available<br>
      [  152.528342] tg3 0013:60:00.3: iommu: 64-bit OK but direct DMA
      is limited by 800002000000000<br>
      [  152.528359] tg3 0013:60:00.3: iommu: 64-bit OK but direct DMA
      is limited by 800002000000000<br>
      [  152.528381] tg3 0013:60:00.3: DMA engine test failed, aborting<br>
      [  152.528515] tg3: probe of 0013:60:00.3 failed with error -12<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 10/6/23 17:06, Jason Gunthorpe
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20231006113644.GN682044@nvidia.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Oct 06, 2023 at 01:20:17PM +0530, Tasmiya Nalatwad wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Greetings,

[linux-next] [6.6.0-rc3-next-20230929] WARNING: CPU: 5 PID: 185612 at
drivers/iommu/<a class="moz-txt-link-freetext" href="iommu.c:3049">iommu.c:3049</a> iommu_setup_default_domain+0x410/0x680

--- Traces ---

[ 6296.425934] WARNING: CPU: 5 PID: 185612 at drivers/iommu/<a class="moz-txt-link-freetext" href="iommu.c:3049">iommu.c:3049</a>
iommu_setup_default_domain+0x410/0x680
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Does this fix it too? I think it should?

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/r/0-v1-2b52423411b9+164fc-iommu_ppc_defdomain_jgg@nvidia.com">https://lore.kernel.org/r/0-v1-2b52423411b9+164fc-iommu_ppc_defdomain_jgg@nvidia.com</a>

Jason
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center</pre>
  </body>
</html>

--------------yfix7TZyBa6O9vu3Xq2dxoEP--

