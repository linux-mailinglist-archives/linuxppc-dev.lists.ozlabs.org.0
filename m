Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 513714C3A5C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 01:32:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4W2Q3sZbz3cDS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 11:32:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aFvL07xt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aFvL07xt; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4W1m2zsjz2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 11:32:10 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 m13-20020a17090aab0d00b001bbe267d4d1so6643234pjq.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 16:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tKC1TRHCBri+KzcoCYvPSpdvCg/HdwcBnsM6kDgfriM=;
 b=aFvL07xt/0stKeZefxUZbUC+5wQ0c2t8VfgbSdA4KnIJogwafaubJUI86KN4/FvFV5
 jbLhM+LrJv3ypnussHBfpu7uj5KI0PXVQ96Jdo+lCX3ypLIHQGZHtAkyVdAh4mtCu2qS
 ap4TAiaH3AgnoAQmDOleF4kCeej300au8cAl/UdmZr0lqIgLVI2qY4xeiFfraLkMfPy+
 3rauidoZEYE8aGNlxrQXELwdFr9QiuiKZh5bLLIvF73t45sBCn4jewpG/0Te1MH9Hphe
 o/sRG6BxKY9eG6wcyZ3QNsOS/fLPbBIUJS5HWzi/+UPcL9L4idltFRILXZRMw5LpG4at
 ebhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tKC1TRHCBri+KzcoCYvPSpdvCg/HdwcBnsM6kDgfriM=;
 b=IzCuZ8oB3PqeQT7Skud+w1/mjWRPuYVptFLg2L7F2Au/0TWXZLfzjp6UXkvjFz334I
 72v/JGTpnOkr6/W7ljBrRG56iTFfZ5fKG6XPss2GX4a8+tpgk9FZaNIi7ckqICQmi1C6
 9ZidpCRD7vS90qnmhqeTk2wsPV2irC4KeZjvHOBI1N6JHnc1QcKKbmRhMGZebfuJBkXp
 PiNeQDY1JI5GCoNSQ98gllZhImnR872GDDQNCQbuiJk23o4VpMoo1bRVkQ3ibr4QGCbN
 n/dEhobRW23XIdvR2X8G6m9Zg4fe2TXbrCtdAQ7UUD9F6Kl8myy4m8XFChK4OkY/6jfc
 LzRg==
X-Gm-Message-State: AOAM53293k1w5YqYeZKK3K26gLxmjKqj2tPIn5JiWKn0yML76/tBNbF3
 pYBWxykg6OT/QyxSFVqZG/8=
X-Google-Smtp-Source: ABdhPJx6JkQFQ7K41lpXb/O0ach2L1AgRseaw/gapGt3TSCEZRFc8m8HvGMfvjmlWhxUObOSXiOjgw==
X-Received: by 2002:a17:902:f701:b0:14d:7cea:82af with SMTP id
 h1-20020a170902f70100b0014d7cea82afmr4868065plo.71.1645749128161; 
 Thu, 24 Feb 2022 16:32:08 -0800 (PST)
Received: from localhost (115-64-212-59.static.tpgi.com.au. [115.64.212.59])
 by smtp.gmail.com with ESMTPSA id
 g28-20020a63111c000000b00374646abc42sm602400pgl.36.2022.02.24.16.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 16:32:07 -0800 (PST)
Date: Fri, 25 Feb 2022 10:32:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
 <20220224171207.GM614@gate.crashing.org>
In-Reply-To: <20220224171207.GM614@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1645748601.idp48wexp9.astroid@bobo.none>
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of February 25, 2022 3:12 am:
> On Thu, Feb 24, 2022 at 03:05:28PM +1000, Nicholas Piggin wrote:
>> + * gcc 10 started to emit a .machine directive at the beginning of gene=
rated
>> + * .s files, which overrides assembler -Wa,-m<cpu> options passed down.
>> + * Unclear if this behaviour will be reverted.
>=20
> It will not be reverted.  If you need a certain .machine for some asm
> code, you should write just that!

It should be reverted because it breaks old binutils which did not have
the workaround patch for this broken gcc behaviour. And it is just
unnecessary because -m option can already be used to do the same thing.

Not that I expect gcc to revert it.

>=20
>> +#ifdef CONFIG_CC_IS_GCC
>> +#if (GCC_VERSION >=3D 100000)
>> +#if (CONFIG_AS_VERSION =3D=3D 23800)
>> +asm(".machine any");
>> +#endif
>> +#endif
>> +#endif
>> +#endif /* __ASSEMBLY__ */
>=20
> Abusing toplevel asm like this is broken and you *will* end up with
> unhappiness all around.

It actually unbreaks things and reduces my unhappiness. It's only done=20
for broken compiler versions and only where as does not have the=20
workaround for the breakage.

Thanks,
Nick
