Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9895119EF47
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 04:20:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wZ4Z5SB1zDqpf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 12:19:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vQ7a1Hjw; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wZ304hQ7zDqnv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 12:18:35 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id v23so3919937pfm.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 19:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=sNB2kSqfAGjKkdm67T8MULHo187RnCU6KplbDBH3jEw=;
 b=vQ7a1HjwK5NJRIGb4XN6KEObuYeovS283lpF5IQS0WutFbM4oQiQzpHv6oQe966cKs
 1TW0GDdFGmjvAYqCXXru7aI1Vd/IYjXskENjsSsigOaBnbgQbYqsXnHs8pZyvtpRZwb0
 t1U5pwXjJ2Uf4ayT5Y+h2XMAdo8j7a1tVyAMPPuDkYD7sjTCYqpJncHKDq6ciKfJmcxC
 tuLhDf2+RSnx8ouXA70QXsEYAA76SVL25VGRnpMhgieNwbgaZ7qh8bXA/Q8Qi6XUtOEL
 MTDFThon4jhFxv0kskjwR3pz6yrtBYAlzOBLqVbm6pnkoMgZFlyfuU6TXjGQ3hPrau+b
 QaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=sNB2kSqfAGjKkdm67T8MULHo187RnCU6KplbDBH3jEw=;
 b=kx8KAJY8UfzkVeDKygtXWdRb2C4oYxsRZJ7ahutTKuAW0yZwuLnn5Zlz74v7jNVWAH
 pKa02etnPSs2rlgUnkoU68vTYRN1Wx2AdmUZ4apLpBiZxAtAweUeNaT5nR3mcyGnbQEW
 1pedMVw30Y7W38o0JGVEVija0Ew5WhjPiIBwjtYt0yHaivEbn4JQn3plLdA6wZzVF+UF
 IghshREf49SvnoWeSK/0zs72yTudTj6ydQS4IqGqkltveOcqSAPcX3AET+Jvv9CzIx7p
 a3j9ypPLWUXFhOy6rY4d6CfWS7CK2bwILO+Vnoedc1PzSknbYnQcY0dtpMFlPc1SV/eh
 PV6g==
X-Gm-Message-State: AGi0PuZ5NsWfoxMFhxmta0YXsc0oSAd0N5hFWsPaLV71unJXe1LF3IQk
 Gyz3zDNl3adw2zp9yOfgdrw=
X-Google-Smtp-Source: APiQypKGZ7SudhFCfHxxJxZ1mIR2U2MmQixDgtrELI7RyucNMVkCbLaixKke5vVBIf9baP9IXupS1A==
X-Received: by 2002:a63:db10:: with SMTP id e16mr2519133pgg.361.1586139512449; 
 Sun, 05 Apr 2020 19:18:32 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id 8sm10443169pfy.130.2020.04.05.19.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 19:18:31 -0700 (PDT)
Date: Mon, 06 Apr 2020 12:17:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mce: Add MCE notification chain
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200330071219.12284-1-ganeshgr@linux.ibm.com>
 <1585879413.ubv3w8ta2y.astroid@bobo.none>
 <a9b03938-5053-3c44-217b-5892533bd38d@linux.ibm.com>
In-Reply-To: <a9b03938-5053-3c44-217b-5892533bd38d@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586139348.0tunz2vuxz.astroid@bobo.none>
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
Cc: aneesh.kumar@linux.ibm.com, santosh@fossix.org, arbab@linux.ibm.com,
 mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh's on April 4, 2020 11:05 pm:
> On 4/3/20 7:38 AM, Nicholas Piggin wrote:
>=20
>> Ganesh Goudar's on March 30, 2020 5:12 pm:
>>> From: Santosh S <santosh@fossix.org>
>>>
>>> Introduce notification chain which lets know about uncorrected memory
>>> errors(UE). This would help prospective users in pmem or nvdimm subsyst=
em
>>> to track bad blocks for better handling of persistent memory allocation=
s.
>>>
>>> Signed-off-by: Santosh S <santosh@fossix.org>
>>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> Do you have any such users yet? It would be good to refer to an example
>> user and give a brief description of what it does in its notifier.
>=20
> Santosh has sent a patch which uses this notification.
> https://patchwork.ozlabs.org/patch/1265062/

Okay. So these things are asynchronous after the machine check. I guess
that's the design of it and memory offlining does something similar by
the looks, but how do you prevent the memory being allocated for=20
something else before the notifiers run?

>>> @@ -263,6 +277,7 @@ static void machine_process_ue_event(struct work_st=
ruct *work)
>>>   	while (__this_cpu_read(mce_ue_count) > 0) {
>>>   		index =3D __this_cpu_read(mce_ue_count) - 1;
>>>   		evt =3D this_cpu_ptr(&mce_ue_event_queue[index]);
>>> +		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
>> Can we really use a blocking notifier here? I'm not sure that we can.
>=20
> I think we can, do you see any problem?

No it looks okay after better look, sorry for the noise.

Thanks,
Nick
=
