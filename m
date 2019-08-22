Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4A99906
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 18:21:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DqXG715gzDrTY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 02:21:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="y7h9TcYZ"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DqV24y1LzDrS1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 02:19:04 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id q139so4260164pfc.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/6q7rQtYmpPu07UC23pGOkomFto6j4I/xA2pjDJO2mQ=;
 b=y7h9TcYZOVPiGAt8F/vf6zbILNSX9wmoS6pg/sLSZ9ZcU0pNR+1Y615HSw4o0OohoR
 h8tQLrpSgt/X0IWIbFKdFxxmfr+TuIAAl13fqoR8PPyLWA+sZPYJbl4vZVA4xZFKlWfO
 sXhtdmRh7U8xGHOH6vrWeRsox/ubvhxLddd2S0sjP2CdvVKJ3dAU12xB9wS3/GPiEyy0
 D+DglZmA7xcYzuevoL0j9r5Gl9ZbTcs84dIv4ROF6MvKnJB6pvq1KovntH1FF5rKYJ87
 1JOBG0jdNRuLb7WAkzJ7xYQlCZRibRI9K7SYpqvcXLOZ3Xsh073f5eVYHsP66b2n5gns
 9L8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=/6q7rQtYmpPu07UC23pGOkomFto6j4I/xA2pjDJO2mQ=;
 b=nUSwomyihcCU4+w1A+/so3wIdAm1JrfQ2SNOX6RJwPtvHvjkQkc8syUdmLRohbwi2B
 mvkkDucy3BWXPnW3ta1OYSbu00U4vwn8aU5Va0s9s7hLC0PD7Aju/V6CWB/jbEnbLlix
 oxU4oCVDUNjmKPoHWs23WbiZ52zYCtW5+H7uTqJEx/mh/mQ790UQvkELapAiI6VZsaZt
 QvrZRumm+Cg3U6a5gpVTMsZRq1YtxhS0Er/9BDKciHw/vRH6iumAxpscikQiecr7csZ3
 rjLRb22jYp3dyeUhXb3ogfgLfTnFJHx7zSAVbeOuy1typ040KlL+DYLINGmoGQ1nBe4u
 OXRw==
X-Gm-Message-State: APjAAAUDqFN2Tp5HrpM+7Kzntqtbzept0cQE+auFOnY9BdhOnNcpVMPQ
 KykdHP0KenyT0ghArrJoPfShFWUbJ74=
X-Google-Smtp-Source: APXvYqyQBqqbKxNGtiSB9T5rxQTgMEhE0sfxASBReeOffp1QhjFhWie2sbpbba5JlM/xfwpMabHb+g==
X-Received: by 2002:a65:690b:: with SMTP id s11mr100488pgq.10.1566490740563;
 Thu, 22 Aug 2019 09:19:00 -0700 (PDT)
Received: from localhost ([183.82.16.115])
 by smtp.gmail.com with ESMTPSA id s125sm35793920pfc.133.2019.08.22.09.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 09:18:59 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/vdso64: inline __get_datapage()
In-Reply-To: <6108a7ed-b4f9-f02f-ca63-1d663bda4990@c-s.fr>
References: <6662919bd80773aaf339e85b14af1ea1ddbfd841.camel@kernel.crashing.org>
 <20190821092959.16066-1-santosh@fossix.org>
 <20190821114423.GC31406@gate.crashing.org>
 <b7cc5d77-dfca-1cf7-f316-636a4f603b04@c-s.fr>
 <20190821121517.GD31406@gate.crashing.org>
 <6108a7ed-b4f9-f02f-ca63-1d663bda4990@c-s.fr>
Date: Thu, 22 Aug 2019 21:48:56 +0530
Message-ID: <87mug1i367.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Le 21/08/2019 =C3=A0 14:15, Segher Boessenkool a =C3=A9crit=C2=A0:
>> On Wed, Aug 21, 2019 at 01:50:52PM +0200, Christophe Leroy wrote:
>>> Do you have any idea on how to avoid that bcl/mflr stuff ?
>>=20
>> Do a load from some fixed address?  Maybe an absolute address, even?
>> lwz r3,-12344(0)  or similar (that address is in kernel space...)
>>=20
>> There aren't many options, and certainly not many *good* options!
>>=20
>
> IIUC, the VDSO is seen by apps the same way as a dynamic lib. Couldn't=20
> the relocation be done only once when the app loads the VDSO as for a=20
> regular .so lib ?

How does address space randomization work for .so libs?

>
> It looks like it is what others do, at least x86 and arm64, unless I=20
> misunderstood their code.
>
> Christophe
