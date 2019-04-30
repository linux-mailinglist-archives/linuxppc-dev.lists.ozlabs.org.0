Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DFDFE03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 18:35:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tnG35nLKzDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 02:35:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tnDW5nnPzDqGm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 02:34:34 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UGLwc8080658
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 12:34:30 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s6sh1hca8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 12:34:30 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Tue, 30 Apr 2019 17:34:29 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Apr 2019 17:34:26 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3UGYPTI19464192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 16:34:26 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9C10AC05E;
 Tue, 30 Apr 2019 16:34:25 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADC1BAC065;
 Tue, 30 Apr 2019 16:34:25 +0000 (GMT)
Received: from localhost (unknown [9.80.206.5])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Apr 2019 16:34:25 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4] powerpc/pseries: Remove limit in wait for dying CPU
In-Reply-To: <20190423223914.3882-1-bauerman@linux.ibm.com>
References: <20190423223914.3882-1-bauerman@linux.ibm.com>
Date: Tue, 30 Apr 2019 11:34:25 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19043016-0072-0000-0000-000004233511
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011023; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01196625; UDB=6.00627556; IPR=6.00977474; 
 MB=3.00026669; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-30 16:34:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043016-0073-0000-0000-00004C0622C1
Message-Id: <877ebbsb8u.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300100
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Michael Bringmann <mwb@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
> This can be a problem because if the busy loop finishes too early, then t=
he
> kernel may offline another CPU before the previous one finished dying,
> which would lead to two concurrent calls to rtas-stop-self, which is
> prohibited by the PAPR.
>
> Since the hotplug machinery already assumes that cpu_die() is going to
> work, we can simply loop until the CPU stops.
>
> Also change the loop to wait 100 =C2=B5s between each call to
> smp_query_cpu_stopped() to avoid querying RTAS too often.

[...]

> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/=
platforms/pseries/hotplug-cpu.c
> index 97feb6e79f1a..d75cee60644c 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -214,13 +214,17 @@ static void pseries_cpu_die(unsigned int cpu)
>  			msleep(1);
>  		}
>  	} else if (get_preferred_offline_state(cpu) =3D=3D CPU_STATE_OFFLINE) {
> -
> -		for (tries =3D 0; tries < 25; tries++) {
> +		/*
> +		 * rtas_stop_self() panics if the CPU fails to stop and our
> +		 * callers already assume that we are going to succeed, so we
> +		 * can just loop until the CPU stops.
> +		 */
> +		while (true) {
>  			cpu_status =3D smp_query_cpu_stopped(pcpu);
>  			if (cpu_status =3D=3D QCSS_STOPPED ||
>  			    cpu_status =3D=3D QCSS_HARDWARE_ERROR)
>  				break;
> -			cpu_relax();
> +			udelay(100);
>  		}
>  	}

I agree with looping indefinitely but doesn't it need a cond_resched()
or similar check?

