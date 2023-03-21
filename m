Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC65C6C2951
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 05:52:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgfNH4sWlz3cM6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 15:52:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SFXLLRho;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SFXLLRho;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgfMP06Bfz30Kr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 15:51:26 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso909550pjf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 21:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679374285;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKZP2IQeKZfNceJJqfFFb5gI4In1QhMPjIWGQ5RwEkE=;
        b=SFXLLRhog3LvGvScuULZnc/enXzhQoFExWZNbsG4AYv/4AjaXHjF0RTPQeCprMdDhA
         NEkiLvFCeeI1Gf8e7MoCgclYAqipZ8RttL5tz9EAMgU32OnVqOyeploWGO3/cXrvz5FS
         R9xPL3ZLHDO9b7RySLXic9MdaEbmbBQXw4FRv6iuQkQgcV6SG2GR4fJ9XgUQTatJqAF1
         w32eymlkJg+Qi5sSdcfDYxBaUCfjC1ZL26nNMU8GNUSILO30e132JwALOTtuKNJFtrDa
         yGq2vDOhQcuaexmMjngTAJ/RVXe2+KZckmQpsGV6gjeaJ+9eCr+jJ5zWfVTh+TipxdF8
         pOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679374285;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dKZP2IQeKZfNceJJqfFFb5gI4In1QhMPjIWGQ5RwEkE=;
        b=N/3rGGetLLBlBK0ezCxpGy+l+KmmN8jAtgqTdXCVQpIloL+Cvsr1ucsW0zIxXEoQGZ
         nnLPyCZYcwnVSkaVVj8VJUme4L7XSSbcJfDBPooLkb9o3gJ8UvCybpjmqvMxUpI/GMRw
         io7d1ihctE82r0sHqTdZFtUgDt23+HQ7ZXYgC/Opl+ICqAeURWFt9+7kMEoVQ+Ba7H3s
         qkwuds3DQwaiEdz6uHgzzyeFLUYUtltdJlJ0OgPLYF+mTWZQhKVQxxta6Xy/i1SmluSr
         zOX127+HJEREetuItbWcdDdUWLOIM3Pszmaiy1BGgoYFwpd4hBQp3GVhCZ5S4OIm17f9
         tVnQ==
X-Gm-Message-State: AO0yUKXtfhSLlCKGH1fzdFrgTqoIv+TXkBrbOpUWhrxSpxXVXtzN8/LC
	Zc5bDWMCcioOICsRuLdpXfk=
X-Google-Smtp-Source: AK7set8bDzX0n3tWpsGHWVc7Zj7sEWISqlDTyyvnJYoYo2YgNuT9td8Abvmv9Kf6PldxKVxME+uGSA==
X-Received: by 2002:a17:902:e882:b0:19a:b869:f2f8 with SMTP id w2-20020a170902e88200b0019ab869f2f8mr1279683plg.21.1679374285157;
        Mon, 20 Mar 2023 21:51:25 -0700 (PDT)
Received: from localhost (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id u19-20020a170902a61300b001a1dc2be791sm1559646plq.259.2023.03.20.21.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 21:51:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Mar 2023 14:51:20 +1000
Message-Id: <CRBSHXMZX79O.ESN0S8V6M644@bobo>
Subject: Re: [RFC PATCH 04/13] powerpc/dexcr: Support userspace ROP
 protection
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Benjamin Gray" <bgray@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221128024458.46121-1-bgray@linux.ibm.com>
 <20221128024458.46121-5-bgray@linux.ibm.com>
 <CQZW0SBFI6QM.3FW6O6LJ0PVS1@bobo>
 <eb19afda911f4868ec6ff194738afcfe7050d5c1.camel@linux.ibm.com>
In-Reply-To: <eb19afda911f4868ec6ff194738afcfe7050d5c1.camel@linux.ibm.com>
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Mar 7, 2023 at 3:37 PM AEST, Benjamin Gray wrote:
> On Tue, 2023-03-07 at 15:05 +1000, Nicholas Piggin wrote:
> > I think it is not quite per-process? I don't actually know how the
> > user
> > toolchain side is put together, but I'm thinking we can not give it a
> > new
> > salt on fork(), but we could on exec(). I think we could actually
> > give
> > each thread their own salt within a process too, right?
>
> Yeah, the error case is we return further than we called in a given
> execution context. A forked child may return after the fork, meaning it
> needs the same key as the parent for the hashchk to work. Exec can get
> a new key because we can't return with any existing hashes. I haven't
> seen enough of kernel thread support to know if/how we can give threads
> their own key. I believe they go through the fork() call that copies
> the parent key currently.

Could look at possibly doing per-thread keys afterward but what you're
doing makes sense so no problem.

Thanks,
Nick
