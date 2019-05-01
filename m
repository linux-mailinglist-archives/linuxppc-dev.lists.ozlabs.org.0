Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC4811021
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 01:13:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vZ2q0P2CzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 09:13:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C9jW4+Wf"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vZ1V6d8dzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 09:12:46 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w24so120386plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 16:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=xkHY0Vk0CxJ06DIPyqIQG5n7Y+l7wmOyvhLV4dHGd9M=;
 b=C9jW4+Wf+dG9vgT4hlyOesCrC6DT31u4n5QFfZ4h83VmJwVBANCoa2/4T7aNfba6O/
 Knev24dh6CyFTdVrpgU/LF1LvjWfogUqgxcQpxw0jJknCi09EFFhBTFVnDBhZ1IIUjjP
 SWfdvb4gNYZInR0Poe2Cc0xZY0C+qsmoyhn/oMeSlpZ9MEor77ihhqx2bbsWLDFChWCi
 6n8XsSL6uEnRD7wSNTbC62rw8zEdy/XYk0Ri+YLGy3jMA1vuZ8JV7tMEUOkBTg8oqI2e
 0c4Cu4BdaxiN5JFG+g5yZcwZThco7XvxoXDbdR0NICQ1jIJ6yCiNagCiXWDb1oKz0UEe
 bNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=xkHY0Vk0CxJ06DIPyqIQG5n7Y+l7wmOyvhLV4dHGd9M=;
 b=PTvQSu3wLStxqyDlxjfPIHd8Yb3iw8D9i4xZX+kHvsJ8x4Ags28dt5mkTSLMlpJkZn
 SSUoJy0qc5ooG5CdwRjUAQeHEvfHH6qTQ8fLT4McLFocu48yDIkP2pJlh0DMg4VexGZI
 4wV7QTl7gy2JWcO/O1AVj9r0n4FMWFbumiTfS5xc0lLpqBN5JauDh7FrKZxAgVOfhKzI
 Ur6Ah2JNhtdNqYz/pPQFxdU90rLVqbEmCjw/BtQd6euAKUbzr09n7Cq+A4l1h8o7EqoU
 V+h3nt3f7FQ+Vk0phS8t78OGrG265Gom0W3xqcxZPbv/1BBvczVaAg4n4xQ4o601/Wf1
 V8cg==
X-Gm-Message-State: APjAAAWnmUdWwLl+fNNQ0qqqMMVGcZzXRU+SbwKHVqYRExBBy/Oo2LSc
 aKJ3GNbGb9RTToeIJ26PE64=
X-Google-Smtp-Source: APXvYqyyNUsriZFwlNNi9BYNctRtO2Ir6dekDtDCQOGJakWCRwdlJTZtC/P8pWDGVUU7/R80WMqfNQ==
X-Received: by 2002:a17:902:302:: with SMTP id 2mr275822pld.232.1556752363524; 
 Wed, 01 May 2019 16:12:43 -0700 (PDT)
Received: from localhost ([61.68.7.233])
 by smtp.gmail.com with ESMTPSA id i10sm93944058pfj.7.2019.05.01.16.12.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 May 2019 16:12:42 -0700 (PDT)
Date: Thu, 02 May 2019 09:12:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4] powerpc/pseries: Remove limit in wait for dying CPU
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, Nathan Lynch
 <nathanl@linux.ibm.com>
References: <20190423223914.3882-1-bauerman@linux.ibm.com>
 <877ebbsb8u.fsf@linux.ibm.com> <87v9yve02x.fsf@morokweng.localdomain>
 <8736lyrzmh.fsf@linux.ibm.com>
In-Reply-To: <8736lyrzmh.fsf@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1556752043.jyg2z3kgaw.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Michael Bringmann <mwb@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch's on May 2, 2019 12:57 am:
> Hi Thiago,
>=20
> Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
>>>> +		while (true) {
>>>>  			cpu_status =3D smp_query_cpu_stopped(pcpu);
>>>>  			if (cpu_status =3D=3D QCSS_STOPPED ||
>>>>  			    cpu_status =3D=3D QCSS_HARDWARE_ERROR)
>>>>  				break;
>>>> -			cpu_relax();
>>>> +			udelay(100);
>>>>  		}
>>>>  	}
>>>
>>> I agree with looping indefinitely but doesn't it need a cond_resched()
>>> or similar check?
>>
>> If there's no kernel or hypervisor bug, it shouldn't take more than a
>> few tens of ms for this loop to complete (Gautham measured a maximum of
>> 10 ms on a POWER9 with an earlier version of this patch).
>=20
> 10ms is twice the default scheduler quantum...
>=20
>=20
>> In case of bugs related to CPU hotplug (either in the kernel or the
>> hypervisor), I was hoping that the resulting lockup warnings would be a
>> good indicator that something is wrong. :-)
>=20
> Not convinced we should assume something is wrong if it takes a few
> dozen ms to complete the operation.

Right, and if there is no kernel or hypervisor bug then it will stop
eventually :)

> AFAIK we don't have any guarantees
> about the maximum latency of stop-self, and it can be affected by other
> activity in the system, whether we're in shared processor mode, etc. Not
> to mention smp_query_cpu_stopped has to acquire the global RTAS lock and
> be serialized with other tasks calling into RTAS. So I am concerned
> about generating spurious warnings here.

Agreed.

>=20
> If for whatever reason the operation is taking too long, drmgr or
> whichever application is initiating the change will appear to stop
> making progress. It's not too hard to find out what's going on with
> facilities like perf or /proc/pid/stack.
>=20
>=20
>> Though perhaps adding a cond_resched() every 10 ms or so, with a
>> WARN_ON() if it loops for more than 50 ms would be better.
>=20
> A warning doesn't seem appropriate to me, and cond_resched should be
> invoked in each iteration. Or just msleep(1) in each iteration would be
> fine, I think.
>=20
> But I'd like to bring in some more context -- here is the body of
> pseries_cpu_die:
>=20
> static void pseries_cpu_die(unsigned int cpu)
> {
> 	int tries;
> 	int cpu_status =3D 1;
> 	unsigned int pcpu =3D get_hard_smp_processor_id(cpu);
>=20
> 	if (get_preferred_offline_state(cpu) =3D=3D CPU_STATE_INACTIVE) {
> 		cpu_status =3D 1;
> 		for (tries =3D 0; tries < 5000; tries++) {
> 			if (get_cpu_current_state(cpu) =3D=3D CPU_STATE_INACTIVE) {
> 				cpu_status =3D 0;
> 				break;
> 			}
> 			msleep(1);
> 		}
> 	} else if (get_preferred_offline_state(cpu) =3D=3D CPU_STATE_OFFLINE) {
>=20
> 		for (tries =3D 0; tries < 25; tries++) {
> 			cpu_status =3D smp_query_cpu_stopped(pcpu);
> 			if (cpu_status =3D=3D QCSS_STOPPED ||
> 			    cpu_status =3D=3D QCSS_HARDWARE_ERROR)
> 				break;
> 			cpu_relax();
> 		}
> }
>=20
> This patch alters the behavior of the second loop (the CPU_STATE_OFFLINE
> branch). The CPU_STATE_INACTIVE branch is used when the offline behavior
> is to use H_CEDE instead of stop-self, correct?
>=20
> And isn't entering H_CEDE expected to be quite a bit faster than
> stop-self? If so, why does that path get five whole seconds[*] while
> we're bikeshedding about tens of milliseconds for stop-self? :-)
>=20
> [*] And should it be made to retry indefinitely as well?

I think so.

Thanks,
Nick
=
