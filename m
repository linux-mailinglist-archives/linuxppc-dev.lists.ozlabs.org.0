Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E9EF299C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 09:48:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477xrf1XcjzF6Fk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 19:48:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477xpW2mvQzF6DG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 19:46:42 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA78cNYe094150
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 7 Nov 2019 03:46:40 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w41w50x5u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2019 03:46:39 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Thu, 7 Nov 2019 08:46:30 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Nov 2019 08:46:27 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA78kQ6752428958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Nov 2019 08:46:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67446A405B;
 Thu,  7 Nov 2019 08:46:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34F97A4060;
 Thu,  7 Nov 2019 08:46:26 +0000 (GMT)
Received: from [9.134.167.121] (unknown [9.134.167.121])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  7 Nov 2019 08:46:26 +0000 (GMT)
Subject: Re: [PATCH 3/3] powerpc/pseries: Fixup config space size of OpenCAPI
 devices
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 fbarrat@linux.vnet.ibm.com, groug@kaod.org
References: <20191022075247.16266-1-clombard@linux.vnet.ibm.com>
 <20191022075247.16266-4-clombard@linux.vnet.ibm.com>
 <f80de6db-cfea-5897-288f-64d002b25d8d@linux.ibm.com>
From: christophe lombard <clombard@linux.vnet.ibm.com>
Date: Thu, 7 Nov 2019 09:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f80de6db-cfea-5897-288f-64d002b25d8d@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110708-0016-0000-0000-000002C18215
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110708-0017-0000-0000-000033230239
Message-Id: <35141b5c-a48c-d0c8-a566-cd3e36121c59@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-07_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911070087
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

On 05/11/2019 06:01, Andrew Donnellan wrote:
> On 22/10/19 6:52 pm, christophe lombard wrote:
>> Fix up the pci config size of the OpenCAPI PCIe devices in the pseries
>> environment.
>> Most of OpenCAPI PCIe devices have 4096 bytes of configuration space.
> 
> It's not "most of", it's "all" - the OpenCAPI Discovery and 
> Configuration Spec requires the use of extended capabilities that fall 
> in the 0x100-0xFFF range.
> 
>>
>> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/pci.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/pci.c 
>> b/arch/powerpc/platforms/pseries/pci.c
>> index 1eae1d09980c..3397784767b0 100644
>> --- a/arch/powerpc/platforms/pseries/pci.c
>> +++ b/arch/powerpc/platforms/pseries/pci.c
>> @@ -291,6 +291,15 @@ static void fixup_winbond_82c105(struct pci_dev* 
>> dev)
>>   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_WINBOND, 
>> PCI_DEVICE_ID_WINBOND_82C105,
>>                fixup_winbond_82c105);
>> +static void fixup_opencapi_cfg_size(struct pci_dev *pdev)
>> +{
>> +    if (!machine_is(pseries))
>> +        return;
>> +
>> +    pdev->cfg_size = PCI_CFG_SPACE_EXP_SIZE;
>> +}
>> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_IBM, 0x062b, 
>> fixup_opencapi_cfg_size);
> 
> An OpenCAPI device can have any PCI ID, is there a particular reason 
> we're limiting this to 1014:062b? On PowerNV, we check the PHB type to 
> determine whether the device is OpenCAPI or not, what's the equivalent 
> for pseries?
> 

Thanks for the review. For pseries, there is no specific OpenCapi PHB 
type which constraints this kind of request.
We are working to found an other solution.

>> +
>>   int pseries_root_bridge_prepare(struct pci_host_bridge *bridge)
>>   {
>>       struct device_node *dn, *pdn;
>>
> 

