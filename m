Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F81E4C24ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:11:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K44rc3GKhz3dkd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 18:52:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mHjXFzZ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (unknown [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K44qc72Zjz3cWk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 18:51:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mHjXFzZ0; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4K44qd41mKz4xZq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 18:51:57 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4K44qd3x3Dz4xdL; Thu, 24 Feb 2022 18:51:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mHjXFzZ0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4K44qc5NDTz4xZq
 for <linuxppc-dev@ozlabs.org>; Thu, 24 Feb 2022 18:51:56 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21O6a4G3003794; 
 Thu, 24 Feb 2022 07:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=88JzvD0Lo2syZ4MV2LqOI2W5StJ6e5xXtx4W6MLB/ms=;
 b=mHjXFzZ0ITiWd3lMVsigeZhnjhghp4vS0R2kDkmuLdyIIshds0dNAW4vH9SLS2TPUtzV
 rHqx38cE4QccK2QGgQybISuF0NkOliQujOYP1mgyAVUmK/Iw1up4N77DrAu6vThoDmMF
 ZJyFSVLaEcu4RTsGyvnd5jNceRGz7s1BzIcC7NaojtQq0H1kV2M9hRNzzkCt4T8y1fvc
 Aw9mJf9x5GnfWHzQig7Tj5K2y6TDP7OGCu1cNVu+nEGyMDPDA0vuFMcLgkbP6hNo+dpD
 xdFDymNSzWsXbjiLMYxv6asJv2wDgc2jJHZNz6p8N9dHnSEGg4ciR5Aniuu5NCTS3Swc sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edtv84jpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 07:51:48 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21O7Pwii016093;
 Thu, 24 Feb 2022 07:51:48 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edtv84jpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 07:51:48 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21O7gk3w014996;
 Thu, 24 Feb 2022 07:51:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ear69ffaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 07:51:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21O7pijp26280258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 07:51:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06A9F42042;
 Thu, 24 Feb 2022 07:51:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2B4A4204C;
 Thu, 24 Feb 2022 07:51:42 +0000 (GMT)
Received: from [9.43.32.100] (unknown [9.43.32.100])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 07:51:42 +0000 (GMT)
Message-ID: <091f4e0b-540b-ee5b-c07c-0362d53821df@linux.ibm.com>
Date: Thu, 24 Feb 2022 13:21:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/5] Avoid kdump service reload on CPU hotplug events
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
References: <20220221084624.85792-1-sourabhjain@linux.ibm.com>
 <YhRdfu++s5dJMS5L@MiWiFi-R3L-srv>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <YhRdfu++s5dJMS5L@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M-_cRalXa_MqhQAsU1RHxaiuPma2ct_S
X-Proofpoint-GUID: JAhGDZ_dURGTpTDBLZkB4yR2831c6-QG
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202240044
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
Cc: linuxppc-dev@ozlabs.org, kexec@lists.infradead.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Baoquan,

> Hi,
>
> On 02/21/22 at 02:16pm, Sourabh Jain wrote:
>> On hotplug event (CPU/memory) the CPU information prepared for the kdump kernel
>> becomes stale unless it is prepared again. To keep the CPU information
>> up-to-date a kdump service reload is triggered via the udev rule.
>>
>> The above approach has two downsides:
>>
>> 1) The udev rules are prone to races if hotplug event is frequent. The time is
>>     taken to settle down all the kdump service reload requested is significant
>>     when multiple CPU/memory hotplug is performed at the same time. This creates
>>     a window where kernel crash might not lead to successfully dump collection.
>>
>> 2) Unnecessary CPU cycles are consumed to reload all the kdump components
>>     including initrd, vmlinux, FDT, etc. whereas only one component needs to
>>     update that is FDT.
> I roughly went through this sereis, while haven't read the code
> carefully. Seems the issue and the approach are similar to what below
> patchset is doing. Do you notice below patchset from Oracle engineer?
> And is there stuff the ppc code can be rebased on and reused?
>
> [PATCH v4 00/10] crash: Kernel handling of CPU and memory hot un/plug
> https://lore.kernel.org/all/20220209195706.51522-1-eric.devolder@oracle.com/T/#u

Thanks for the suggestion. I have seen earlier versions of this patch series
but since it did not have support for kexec_load system call we tried 
implementing
something from scratch.

Since Eric's added support for kexec_load and has a generic handler for 
CPU and
memory hotplug let me see if I can rebase my PowerPC changes on top of 
his patches.
The major difference across the distro is that on PowerPC we need to 
update FDT instead
of elfcorehdr on hotplug event.

Thanks,
Sourabh Jain

