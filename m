Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C13DA2C22D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 11:24:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgKrr45cgzDqXr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 21:24:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nVMS2Gyj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgKdc5SJRzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 21:15:00 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AOA1naq042031
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 05:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8Z5YXE1Y4fpFttCXmWd17Pnc7l1ghsXXa7n606pxUDA=;
 b=nVMS2GyjFUgA0xYBq7YO/jzf+fr5TVRb3z2qdC0mzgXQz4bivPxtpOewd1mrYv0oyevW
 F1zu7wJLv/O3ct2Euk3b9RP7GlSDOg2be5FHeTpiXGf5eTCjGawv99bQX9y7Aq28NYIo
 D/3BEpYRFVmcCyd2d9SwVhHa1AIV3VCnXp3QJP8M5RMoQam/QDxkuwhhifbBYrsg+iSm
 OFlygro3nmExvnG9WtcFUh0IDicBRSaqxxycBlqOp1mm1inV/tGwlFVV9Lk7jn1tc5dA
 kBJ1rq0Xa27i3jdbmE10M3eBFv4EUrJ3oa7gQ/Qlo3YUXlsqvKkqUKaOL3FdQ8y92QWY tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 350pdq1cwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 05:14:57 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AOA2CqN044195
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 05:14:57 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 350pdq1cv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 05:14:56 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AOADD8h016125;
 Tue, 24 Nov 2020 10:14:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 34xt5h9sdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 10:14:54 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AOAEqqN55705990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 10:14:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 072865205F;
 Tue, 24 Nov 2020 10:14:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.160.120])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DEC4D52059;
 Tue, 24 Nov 2020 10:14:51 +0000 (GMT)
Subject: Re: [PATCH 3/3] selftests/powerpc: Add VF recovery tests
To: "Oliver O'Halloran" <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201103044503.917128-1-oohall@gmail.com>
 <20201103044503.917128-3-oohall@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <d192485d-c8e0-7798-4a7f-85efe68a41fa@linux.ibm.com>
Date: Tue, 24 Nov 2020 11:14:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201103044503.917128-3-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_04:2020-11-24,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240058
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



On 03/11/2020 05:45, Oliver O'Halloran wrote:

> --- a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
> +++ b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
> @@ -135,3 +135,111 @@ eeh_one_dev() {
>   	return 0;
>   }
>   
> +eeh_has_driver() {
> +	test -e /sys/bus/pci/devices/$1/driver;
> +	return $?
> +}
> +
> +eeh_can_recover() {
> +	# we'll get an IO error if the device's current driver doesn't support
> +	# error recovery
> +	echo $1 > '/sys/kernel/debug/powerpc/eeh_dev_can_recover' 2>/dev/null
> +
> +	return $?
> +}
> +
> +eeh_find_all_pfs() {
> +	devices=""
> +
> +	# SR-IOV on pseries requires hypervisor support, so check for that
> +	is_pseries=""
> +	if grep -q pSeries /proc/cpuinfo ; then
> +		if [ ! -f /proc/device-tree/rtas/ibm,open-sriov-allow-unfreeze ] ||
> +		   [ ! -f /proc/device-tree/rtas/ibm,open-sriov-map-pe-number ] ; then
> +			return 1;
> +		fi


Is it possible to run those tests on pseries? I haven't managed to set 
up a LPAR with a physical function which would let me enable a virtual 
function. All I could do is assign a virtual function to a LPAR. When 
assigning a physical function to the LPAR, enabling a virtual function 
fails because of missing properties in the device tree, so it looks like 
the hypervisor doesn't support it (?).

Same story on qemu.

   Fred


