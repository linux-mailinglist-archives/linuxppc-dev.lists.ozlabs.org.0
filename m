Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A618DE44
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 07:38:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48krZS1L72zF0RH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 17:38:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FhghVPqQ; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48krY0016TzF0dm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 17:37:23 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id nu11so3471451pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 23:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=VW8k6wVhB4Op/FE3jmyG6qbQEiv6X1rDIwb4jxJeEOI=;
 b=FhghVPqQMbWSZ7JikO3mFyGJVN34KhP77TYpHh65QxaK5O4h6AEyUjhBxF+eI6D9US
 s+OxY56UqsvE1EP6hK8FubDqlAg5ZnSYOjndRjeVgiSfPic/Z7rOHkgP8QZRkbe3XyL7
 dTLTyHmtP8/oWC4NYjjJGU/a13t4DCZFrWzdQBCYBtQp5yzrvgTq1QHnENx3JCqGPc7B
 enBFrVUorrMRhESctIoGj6vVO7dKyEhrf4hzn6O3lm7gjaqXdI8k82IxG1NA9YhQWt21
 8rS6q+r4q8EWzyIKH9XfCA3a3DOh7aWwBwHgrFgc2jp9hkd8UfbxqKgZvdDs47DA/bEG
 NYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=VW8k6wVhB4Op/FE3jmyG6qbQEiv6X1rDIwb4jxJeEOI=;
 b=dkwgfQztqxD2VxkDjz/QIbUXWZLvIfMA0R72O9pWQYv6xkMshTZ7tUqorsvxRYJ08q
 2fxrB4mCe0uAYMOLhy5MXjUQf52ExysY/cDopfA4G8JpiGOfKvpKZqa6DKEmlDUZVD0q
 DfBCVa+Gjr+pjLw2tBq3oY8PFuAC7llX3mStJteXgWHu3tVDCvyiaDC6STe55mB0zZDZ
 Oewz2Yomh94HdbgWHCChsx8m0eyhb9p3M29qnifYbyb4Jf/Vw1cIwg/kXLEw+h1THyhN
 2leDhil3s706qF6pl+z+PggwCKLHTm0hxGJgugg2PM4ViNKnayOeiiySa10XvhBFjf1V
 Yi0g==
X-Gm-Message-State: ANhLgQ2wReolEjIfsCzLq423OAXsZRIVWd6fErYBfaLZAv1ZfcNguZ/r
 bJ1RU4tzXWvXsxtTE021wcs=
X-Google-Smtp-Source: ADFU+vvXga/oJvC0zt5sQy+2qIWp4hN/IzN2ALKvBG2OAQoVcahiAYxUumvtqWxjNWxtLRJKwMBNKg==
X-Received: by 2002:a17:90a:2a06:: with SMTP id
 i6mr12186138pjd.99.1584772640261; 
 Fri, 20 Mar 2020 23:37:20 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id q12sm6708403pgi.86.2020.03.20.23.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 23:37:19 -0700 (PDT)
Date: Sat, 21 Mar 2020 16:34:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: avoid harmless preempt warning
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20200320152436.1468651-1-npiggin@gmail.com>
 <6b34ba18-de6b-15c5-1611-fb5c92e065f9@c-s.fr>
In-Reply-To: <6b34ba18-de6b-15c5-1611-fb5c92e065f9@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584772445.f09ly1zhoy.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on March 21, 2020 1:33 am:
>=20
>=20
> Le 20/03/2020 =C3=A0 16:24, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/platforms/pseries/lpar.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platfo=
rms/pseries/lpar.c
>> index 3c3da25b445c..e4ed5317f117 100644
>> --- a/arch/powerpc/platforms/pseries/lpar.c
>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>> @@ -636,8 +636,16 @@ static const struct proc_ops vcpudispatch_stats_fre=
q_proc_ops =3D {
>>  =20
>>   static int __init vcpudispatch_stats_procfs_init(void)
>>   {
>> -	if (!lppaca_shared_proc(get_lppaca()))
>> +	/*
>> +	 * Avoid smp_processor_id while preemptible. All CPUs should have
>> +	 * the same value for lppaca_shared_proc.
>> +	 */
>> +	preempt_disable();
>> +	if (!lppaca_shared_proc(get_lppaca())) {
>> +		preempt_enable();
>>   		return 0;
>> +	}
>> +	preempt_enable();
>=20
> Can we avoid the double preempt_enable() with something like:
>=20
> 	preempt_disable();
> 	is_shared =3D lppaca_shared_proc(get_lppaca());
> 	preempt_enable();
> 	if (!is_shared)
> 		return 0;

I don't mind too much. Same number of lines.

Thanks,
Nick
=
