Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF4617CA0F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 02:02:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z5nR6LtdzF1NJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 12:02:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.196;
 helo=mail-pl1-f196.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GNlwRUAi; dkim-atps=neutral
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z5kH66cTzDrT2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 12:00:07 +1100 (AEDT)
Received: by mail-pl1-f196.google.com with SMTP id y1so1550613plp.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 17:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=SKpsTjwkXtHxFR33ZbtnoX3UyL1my6NqvwiJF3dGxlI=;
 b=GNlwRUAi8VFX1VoJ7692FRMKsAbDD1wsY/fzjSD0M7LjFV89k1pFTzp7uz9cWFbFon
 4X9KvRQnDVRZ9DaDU2KLBXSW1XgsWTKp1a7q3cBwJukY724OQbeG7uk/QNWuQnMv4SLl
 EKaXHyzxqHrKlcKO8wPcAAjCTHwNLLnEpxHwaas3w2tnmOFoj+7mgpTiUUgtt3SLO4mF
 lbz0lyroHsWNemyMwWvx1x1ZiZiuMQqE0y5c6xy3wvzHUtmuj29W3XoG6zYf8fngcZhz
 +CZydXupJz2z16aKmxXcqyrL4CY43uW/WmIT7eOrSS39GioWY0YRptRqSOJQEJP5Sn4Z
 HM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=SKpsTjwkXtHxFR33ZbtnoX3UyL1my6NqvwiJF3dGxlI=;
 b=AH7HfPQWZw2P3JXHlRLpr2WgIjML52Uq7HkHfmFPj++uH3C+7AETtFqv5RX4Uc/GOY
 PWb0CK/59Lf6qmveBivGOhnwlMl2NvN8E+ydnsQksor0u9BrtbDW0JUCYUpvUNHcL03q
 B+JoKMbIkaR5GZ9KY7wENcBrZ1DzXvkHe09h6nfLEu17ek5jxNboxLZ3XSLl8ofCpRV5
 ylyZnKU2lP9pT3Y8izeW7XF+WcUy3C12YFl/HF/BxL2rUuhMKsrjTr+IbEp1bftm3/g3
 +n2NYWhqnd4Jstp0DltPBEkPdvQLTPbB/P100JyTf6yKyVoUCbaWqb+ipaBVMsdxPwK4
 1TJQ==
X-Gm-Message-State: ANhLgQ0amTyfmJSWhgz+eFF30WiprAaTFgsXP0fj3DbcLqUEJ16CdgSV
 01yYuKoV6CTh7fXrnhd14r8=
X-Google-Smtp-Source: ADFU+vuamSllmbtF+oKOGVuQWRQd7oG0YECV7vRQRHxtYdyNtqP5ovm4/NfGO+FqhWY4vsQ4jHt/2A==
X-Received: by 2002:a17:90a:d103:: with SMTP id
 l3mr6389502pju.116.1583542741151; 
 Fri, 06 Mar 2020 16:59:01 -0800 (PST)
Received: from localhost (193-116-204-226.tpgi.com.au. [193.116.204.226])
 by smtp.gmail.com with ESMTPSA id c7sm29483001pfp.98.2020.03.06.16.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 16:59:00 -0800 (PST)
Date: Sat, 07 Mar 2020 10:58:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200303014527.39377-1-npiggin@gmail.com>
 <20200303230950.GM22482@gate.crashing.org>
 <1583379060.p6od1jalr3.astroid@bobo.none>
 <20200305105503.GZ22482@gate.crashing.org>
In-Reply-To: <20200305105503.GZ22482@gate.crashing.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1583542596.l37hgse8mc.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool's on March 5, 2020 8:55 pm:
> On Thu, Mar 05, 2020 at 01:34:22PM +1000, Nicholas Piggin wrote:
>> Segher Boessenkool's on March 4, 2020 9:09 am:
>> >> +override flavour :=3D linux-ppc64v2
>> >=20
>> > That isn't a good name, heh.  This isn't "v2" of anything...  Spell ou=
t
>> > the name "ELFv2"?  Or as "elfv2"?  It is just a name after all, it is
>> > version 1 in all three version fields in the ELF headers!
>>=20
>> Yeah okay. This part is only for some weird little perl asm generator
>> script, but probably better to be careful. linux-ppc64-elfv2 ?
>=20
> That generator is from openssl, or inspired by it, it is everywhere.
> So it is more important to get it right than it would seem at first
> glance ;-)
>=20
> That name looks perfect to me.  You'll have to update REs expecting the
> arch at the end (like /le$/), but you had to already I think?

le$ is still okay for testing ppc64le, unless you wanted me to add the=20
-elfv2 suffix on there as well? If that was the case, for consistency
we'd also have to add -elfv1 for the BE v1 case. I was just going to add
-elfv2 for the new variant.

Thanks,
Nick
=
