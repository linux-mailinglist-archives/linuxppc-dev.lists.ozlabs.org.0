Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E18155285
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 07:43:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DQk86PZLzDqfX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 17:43:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vs8xRFTr; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DQhY3HcxzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 17:42:16 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id i6so1132387otr.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 22:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=nS5JPWneySiodQp4hbvudj9hL13ty2+PLssqsVAS96w=;
 b=Vs8xRFTrFsZE+EsSeCBIS2SL2f3chCCp8q53YEs384RGhmJyR25P2g1CveTLhp+fQg
 4YqpqJxKR3akAHbk38yJBQi7gRysih+h5j9CVYCFcCy7Z2AQtOoaJqxMIkT9Vi4bwJX1
 ZULLciChr57C6Yr4X2mqzTXrrwKj1tYhY/ADWz3ljJ3emjYTFa51ndT1oevSdaAlBTRc
 ObcLLuahG2SyQpYCPeIRv6sxUDF7wPlSEwZDKSLgnTiND+jPzhpg0qHCI7fttrPpc/Nx
 F35SCGsNLUZG43xmMpe6w4U3aPkHWvXa+hdcOo2gJhw1Qpzsfekyefja1knccBOZ3MH4
 b1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=nS5JPWneySiodQp4hbvudj9hL13ty2+PLssqsVAS96w=;
 b=eSIbgCvxQSacd3T0vWB6bxeFXGD91V13aJwSYjtobwjNBOaDsQYlsOzRteJ10eXmXY
 FyvwXuysJ0/LWcPDkTImemhLl/LFbozbDDH21f7dpT2uzuAY7qYplIyrBjdaaUMdJxaB
 SdKKhVaLpZiHrkV0Whgot8KuIIeCpHP8Og5SxTrn3tobHsiBdm+baNZxpM+j5/aHVnpn
 Cd8FEh8bThekP78PDiMlnAAQnbHokek7yTAVtv1ZkCogRegBmi42jjovDUppZ9gCV4Y7
 EvubuCmT1m+Omi/5EI9nEOmnyNg2KKjc0rMFQLRjQ2I4w+Q6neRiSBpllveWkiNEWVUH
 SdWQ==
X-Gm-Message-State: APjAAAVFWkZBSk2HGeKIO4O82NpxkpYsFM/w5F7jKkpptLT2hIQfx6jB
 Fk+7TK5rxfqIiLUBxWQxCSf2xmzSRKg=
X-Google-Smtp-Source: APXvYqxY08dp4nEVmXY+bzQpTc9NeccNUwPT87+k4AMkhnYV8ZH2K7XLvmf5ma93LqZCe823DQW28w==
X-Received: by 2002:a05:6830:12c3:: with SMTP id
 a3mr1569040otq.341.1581057732875; 
 Thu, 06 Feb 2020 22:42:12 -0800 (PST)
Received: from ubuntu-x2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id z21sm777102oto.52.2020.02.06.22.42.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 22:42:12 -0800 (PST)
Date: Thu, 6 Feb 2020 23:42:10 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/vdso32: mark __kernel_datapage_offset as
 STV_PROTECTED
Message-ID: <20200207064210.GA13125@ubuntu-x2-xlarge-x86>
References: <20200205005054.k72fuikf6rwrgfe4@google.com>
 <10e3d362-ec29-3816-88ff-8415d5c78e3b@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10e3d362-ec29-3816-88ff-8415d5c78e3b@c-s.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 05, 2020 at 07:25:59AM +0100, Christophe Leroy wrote:
> 
> 
> Le 05/02/2020 à 01:50, Fangrui Song a écrit :
> > A PC-relative relocation (R_PPC_REL16_LO in this case) referencing a
> > preemptible symbol in a -shared link is not allowed.  GNU ld's powerpc
> > port is permissive and allows it [1], but lld will report an error after
> > https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=ec0895f08f99515194e9fcfe1338becf6f759d38
> 
> Note that there is a series whose first two patches aim at dropping
> __kernel_datapage_offset . See
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=156045 and
> especially patches https://patchwork.ozlabs.org/patch/1231467/ and
> https://patchwork.ozlabs.org/patch/1231461/
> 
> Those patches can be applied independentely of the rest.
> 
> Christophe

If that is the case, it would be nice if those could be fast tracked to
5.6 because as it stands now, all PowerPC builds that were working with
ld.lld are now broken. Either that or take this patch and rebase that
series on this one.

Cheers,
Nathan
