Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C22155415
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 09:57:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DThw1355zDqQM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 19:57:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DTgb3sXpzDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 19:56:42 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0178nNuU059431
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Feb 2020 03:56:39 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y0murcjwc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Feb 2020 03:56:39 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Fri, 7 Feb 2020 08:56:37 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Feb 2020 08:56:35 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0178uX5s43712578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Feb 2020 08:56:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6EF74204B;
 Fri,  7 Feb 2020 08:56:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B061C42049;
 Fri,  7 Feb 2020 08:56:33 +0000 (GMT)
Received: from pic2.home (unknown [9.145.63.138])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Feb 2020 08:56:33 +0000 (GMT)
Subject: Re: [PATCH 1/1] powerpc/eeh: fix deadlock handling dead PHB
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <0547e82dbf90ee0729a2979a8cac5c91665c621f.1581051445.git.sbobroff@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Fri, 7 Feb 2020 09:56:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0547e82dbf90ee0729a2979a8cac5c91665c621f.1581051445.git.sbobroff@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20020708-0016-0000-0000-000002E48F7E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020708-0017-0000-0000-0000334778AE
Message-Id: <d1f6c85b-fe63-e5f3-438c-b77c938ce003@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-06_04:2020-02-06,
 2020-02-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002070068
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



Le 07/02/2020 à 05:57, Sam Bobroff a écrit :
> Recovering a dead PHB can currently cause a deadlock as the PCI
> rescan/remove lock is taken twice.
> 
> This is caused as part of an existing bug in
> eeh_handle_special_event(). The pe is processed while traversing the
> PHBs even though the pe is unrelated to the loop. This causes the pe
> to be, incorrectly, processed more than once.
> 
> Untangling this section can move the pe processing out of the loop and
> also outside the locked section, correcting both problems.
> 
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Tested-by: Frederic Barrat <fbarrat@linux.ibm.com>

I think it also needs:
Fixes: 2e25505147b8 ("powerpc/eeh: Fix crash when edev->pdev changes")
Cc: stable@vger.kernel.org # 5.4+


   Fred


> I have only compile tested this fix, Frederic Barrat (who discovered it) has
> offered to test it (thanks!).
> 
>   arch/powerpc/kernel/eeh_driver.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index 3dd1a422fc29..d6e75a8a14ce 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -1190,6 +1190,17 @@ void eeh_handle_special_event(void)
>   			eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
>   			eeh_handle_normal_event(pe);
>   		} else {
> +			eeh_for_each_pe(pe, tmp_pe)
> +				eeh_pe_for_each_dev(tmp_pe, edev, tmp_edev)
> +					edev->mode &= ~EEH_DEV_NO_HANDLER;
> +
> +			/* Notify all devices to be down */
> +			eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
> +			eeh_set_channel_state(pe, pci_channel_io_perm_failure);
> +			eeh_pe_report(
> +				"error_detected(permanent failure)", pe,
> +				eeh_report_failure, NULL);
> +
>   			pci_lock_rescan_remove();
>   			list_for_each_entry(hose, &hose_list, list_node) {
>   				phb_pe = eeh_phb_pe_get(hose);
> @@ -1198,16 +1209,6 @@ void eeh_handle_special_event(void)
>   				    (phb_pe->state & EEH_PE_RECOVERING))
>   					continue;
>   
> -				eeh_for_each_pe(pe, tmp_pe)
> -					eeh_pe_for_each_dev(tmp_pe, edev, tmp_edev)
> -						edev->mode &= ~EEH_DEV_NO_HANDLER;
> -
> -				/* Notify all devices to be down */
> -				eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
> -				eeh_set_channel_state(pe, pci_channel_io_perm_failure);
> -				eeh_pe_report(
> -					"error_detected(permanent failure)", pe,
> -					eeh_report_failure, NULL);
>   				bus = eeh_pe_bus_get(phb_pe);
>   				if (!bus) {
>   					pr_err("%s: Cannot find PCI bus for "
> 

