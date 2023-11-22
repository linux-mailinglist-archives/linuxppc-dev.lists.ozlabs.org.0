Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A07F53BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 23:54:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C/IKxRG+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbGlk2f2gz3dLn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 09:54:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C/IKxRG+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=baloshikhan51@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbDSN1lsRz30h0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 08:11:14 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5440f25dcc7so326483a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 13:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700687471; x=1701292271; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fjmsZnDVQCroegRjKK1l8HTpJf22Aa4OPuXuKR/bUBQ=;
        b=C/IKxRG+BRRFYUHiu6JpiGOTfLSwZFC0mi9wE8PRvUZgrrm/KMad58viGO9DK3Ihs8
         zxcJq7zvpmoOqm8YCkEfJeqPe0r2d/HVPEUn+EYLeqAHPvO6d+SfTiOq1efwEOUHtXY5
         vPAXcjoKzEb6oHzzkJuBfMAFXajhOk5koDXhW32MrrN4tVUP7AoRP/OwbDhkf20dCJ2/
         IR+OMJEBDEuz1HS9V8sgV3bZFY8omKzl6A6l8bIi282sCKDEAU3ldynKAOLqzOln6ulW
         mKaPP+KJa6GpLBPQotZRrU2QnMMO+6eIpz5iZFugrSGyLjLBozh2mgOWnrild5An4fkZ
         fzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700687471; x=1701292271;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjmsZnDVQCroegRjKK1l8HTpJf22Aa4OPuXuKR/bUBQ=;
        b=iEQ6Ueh335cYNMoavRoQ45vLEg6XNMovZ+Hh8NMNsF+oKyjxpvfJjcfPThLbcPztf9
         zfZl/riikzklBW9Iv4uY+0+Sj3ma77pME4p6OPRVI4R/IzS40jYm2vq6CwJliCRKEhvZ
         BcSqs0X/nowaBDNHqENmFbkhrzzJFc5/Sh1hsHSAgTl5eHk29sJiY+r/LvKu5he7uOlA
         Ud5RQhovq/GW387cEgZOhKNjIpzzaynLrKYSZsGUYhwl7xTP8otGsR8UA3evCPT5n9Z0
         1x+kW6CoRlM0ozUbuz5Goa2AXJefBVFHcZBHjzNIv4d+SHDZYKZu/FDz53RFaCfndy7p
         YZKA==
X-Gm-Message-State: AOJu0YwWIUWfB6zuzitIiN0I3DDW2/jUCjjWDjyTjLKtemyrsbWPvYRG
	sv+QSLdgNKRNcn56A02HtUCPddDhgz9rr5PRa/Y=
X-Google-Smtp-Source: AGHT+IHiFGbYJlrZRvlDV0hGiqOo41XQ95D8gT7hx1qCIMbEgzd3t0/HMG1EACji3Spv56TAy2HhFKlTwoilxn7Ztz8=
X-Received: by 2002:a17:906:3b01:b0:9f9:2d85:1ccc with SMTP id
 g1-20020a1709063b0100b009f92d851cccmr2517505ejf.33.1700687471284; Wed, 22 Nov
 2023 13:11:11 -0800 (PST)
MIME-Version: 1.0
From: Khan Baloshi <baloshikhan51@gmail.com>
Date: Thu, 23 Nov 2023 02:10:57 +0500
Message-ID: <CAGQ-J9MrQVGJZcSqad8e7Zr4LZQ8-sOe23bc6EeTbTt=6HKr9w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] rust: Allow MODVERSIONS
To: mmaurer@google.com
Content-Type: multipart/alternative; boundary="0000000000009995f6060ac42875"
X-Mailman-Approved-At: Thu, 23 Nov 2023 09:54:00 +1100
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
Cc: nicolas@fjasle.eu, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, masahiroy@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, mcgrof@kernel.org, gary@garyguo.net, ojeda@kernel.org, laura@labbott.name, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000009995f6060ac42875
Content-Type: text/plain; charset="UTF-8"



--0000000000009995f6060ac42875
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--0000000000009995f6060ac42875--
