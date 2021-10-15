Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9542EA7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 09:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVywt6H6yz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 18:45:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aX1ve1EK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aX1ve1EK; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVywF0zrQz305D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 18:44:44 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id g14so7718092pfm.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=WC3f9hNJW5T/vDro/czupwKZjfHMDkQPiailQf60oQw=;
 b=aX1ve1EK4A6duYnoIhYP0cvHIwtyIqbXeRJ9aV/zcMewyy26D8gioM/sAnT9GvUDgm
 67dyMaybVNIokptI3sA1n5zxc9JCSW+x4WvYCo9YiDeoCnZ5+LWTub0Tn49xsOsStzHK
 uZpR7Rtha7TCNCVTKEKqbWwr3g1KZDjtVccfHiPatk9MOurJ7qUF3687L7ydXl9uzr81
 +X4ZtnezK1+TgBCtwxMuCvyyLehnwSC3wDkrgH+4T1KMcHDRJLVsLOenv31ZKPwGjACo
 CYsSV6F+98QKZJUWKbnPZaMPLMPzRSbw9xGDS8+RcswCyHT8pBYOLY1fZ4BM2VJY0R2/
 tFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=WC3f9hNJW5T/vDro/czupwKZjfHMDkQPiailQf60oQw=;
 b=TkLqOnMUkKYJDqxBKfi4cgPZDFcoiU3DbrQ+Pycp4uorlkVYnboc1j5wOte34PKABb
 IxIJtWR1eiwmexpChP/mt3NHgiPDiS9Dk23FEh/vyAV9i3y3CuN2CPi5guflKuW9CtR1
 q0Z42yu4V41xuP7RapYuQjmF1w+cOPM3HkXFBmigNXG9jExepRKprksnD7GAvckNuH7c
 k0hocff9EC4DG/QLZWH8Bv+zaDVUkDqQK2qGShHyR3osE0rEtoRksH782SEXcmc5dvUl
 3silxzV5Af7jjVAZXP3DcpM+PTAs4pKWexQeUXqmkyw6D2FgGZU0Jg6wpcCvUfhAFqmG
 OIpA==
X-Gm-Message-State: AOAM533yb+auN8RSAAuPdlKkr0AVQXQsOXbpZ8hXUkUwTGe11rJD6CVJ
 S6uuidOtuW5BatPJ3e7tOrQ=
X-Google-Smtp-Source: ABdhPJw7Oqku7Cn1mfNRn9Brk31lTTS/eUfER7F5h3UYrT/QwYS6M1l7ZqPbCBTk48STqbopyUgiTg==
X-Received: by 2002:a65:6499:: with SMTP id e25mr7977557pgv.146.1634283881157; 
 Fri, 15 Oct 2021 00:44:41 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 w125sm4285599pfc.66.2021.10.15.00.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:44:40 -0700 (PDT)
Date: Fri, 15 Oct 2021 17:44:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mce: check if event info is valid
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210806132307.367688-1-ganeshgr@linux.ibm.com>
 <4f9431fd-74b0-2ce4-807e-9796b326d729@linux.ibm.com>
 <87ily9nii0.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ily9nii0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1634282394.zxx1qfpuu6.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of October 7, 2021 10:09 pm:
> Ganesh <ganeshgr@linux.ibm.com> writes:
>> On 8/6/21 6:53 PM, Ganesh Goudar wrote:
>>
>>> Check if the event info is valid before printing the
>>> event information. When a fwnmi enabled nested kvm guest
>>> hits a machine check exception L0 and L2 would generate
>>> machine check event info, But L1 would not generate any
>>> machine check event info as it won't go through 0x200
>>> vector and prints some unwanted message.
>>>
>>> To fix this, 'in_use' variable in machine check event info is
>>> no more in use, rename it to 'valid' and check if the event
>>> information is valid before logging the event information.
>>>
>>> without this patch L1 would print following message for
>>> exceptions encountered in L2, as event structure will be
>>> empty in L1.
>>>
>>> "Machine Check Exception, Unknown event version 0".
>>>
>>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>>> ---
>>
>> Hi mpe, Any comments on this patch.
>=20
> The variable rename is a bit of a distraction.
>=20
> But ignoring that, how do we end up processing a machine_check_event
> that has in_use =3D 0?
>=20
> You don't give much detail on what call path you're talking about. I
> guess we're coming in via the calls in the KVM code?
>=20
> In the definition of kvm_vcpu_arch we have:
>=20
> 	struct machine_check_event mce_evt; /* Valid if trap =3D=3D 0x200 */
>=20
> And you said we're not going via 0x200 in L1. But so shouldn't we be
> teaching the KVM code not to use mce_evt when trap is not 0x200?

I'm not sure we want the MCE to skip the L1 either. It should match the=20
L0 hypervisor behaviour as closely as reasonably possible.

We might have to teach the KVM pseries path to do something about the
0x200 before the common HV guest exit handler (which is where the L1
message comes from).

Thanks,
Nick
