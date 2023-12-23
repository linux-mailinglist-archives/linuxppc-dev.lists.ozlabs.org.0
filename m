Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F281D271
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 06:19:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TFPCgzse;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sxst94z2lz3cbt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 16:19:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TFPCgzse;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxssK02Msz2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Dec 2023 16:18:59 +1100 (AEDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-35fb96f3404so10391165ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 21:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703308735; x=1703913535; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnwDpdbEms0r9ctWFykUHT4Fg9JnNMIjKFVXl1aMRgY=;
        b=TFPCgzseSa962V7bYETpZWP7cFwgz4ZdgQFAyYzlin3Dz1/ceaKl8/8rK0TgZmEvYW
         pKmwWFhvbvfuG/jKk3Msyjs5uBPzMWI0SN5Kaw1IY3cCbHwhXiooyUTzeynE8Fuypc20
         t/OKijYhtY2OEQIJeaZEbkd2i/PCExP+uwlbGREGLJlXqBzyiIjM+WFKI8sNQ4+xOo3J
         9fmyTcBxDuOgmL4CjZPVjIkpzIfsVpZeM6FRcYB6AtRZ2mmHnnRhQG7gtYV9iGDipEMP
         Br7JqUL8LQyPDGT4u7cKIE1bH83AFTYe6rrYbSAdPdDc7vD/22LaV39xtvRyZXlhI9WO
         5YPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703308735; x=1703913535;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XnwDpdbEms0r9ctWFykUHT4Fg9JnNMIjKFVXl1aMRgY=;
        b=okztGvwCC0k6BSp5ZDTQZZdGP6/ZFyfeq4fIkNO9l9KZqgXXMLNu1Uo5EUsfifaujc
         9aPPrgPig934p4LvGxX59gE1tLeJJSKlQf7doHgEI4zJicYKj9da7v+h/g6/3oqyF2i6
         jbEPg3eOSCmQLQhtMSeSPhJJtJPdauAZ+E1a2A8o1w27rBGW1BBv7dYOqoGeplXVkz9j
         28U1Pt5buteSx4+iOEO2DJLYXusw8VBoL6C5+m+nuBKfgehbFVqPYZJ9SiBcbR9JVQY/
         d2sgEZkrYakOJeZbyKy9eEcD811YJwN97o2Rm+GdvbZISYEK0tWvP6iSNFFHhc6UDE+2
         GSXQ==
X-Gm-Message-State: AOJu0YwQhmQw/zgYeWoXsOJl36/imcBMIjrudVN9+B1y9GuwajDlZ6w0
	Y89aNrNcGUfUaP3krBcA3Vs=
X-Google-Smtp-Source: AGHT+IFaHzlucHRk+1cz9vp3pAi/3gV++IZOiVArAG66rH8YvEuO0wUOoZEKgYXgJDJX2cMfaNfq+A==
X-Received: by 2002:a05:6e02:1707:b0:35f:e71f:4c60 with SMTP id u7-20020a056e02170700b0035fe71f4c60mr2472288ill.13.1703308735520;
        Fri, 22 Dec 2023 21:18:55 -0800 (PST)
Received: from localhost ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id c6-20020a17090a020600b0028aed79c244sm3641553pjc.1.2023.12.22.21.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 21:18:55 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 23 Dec 2023 15:18:45 +1000
Message-Id: <CXVGJUAN6935.1L9WYI8NQ4R0O@wheely>
Subject: Re: [kvm-unit-tests PATCH 1/9] s390x: clean lib/auxinfo.o
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Claudio Imbrenda" <imbrenda@linux.ibm.com>
X-Mailer: aerc 0.15.2
References: <20231222135048.1924672-1-npiggin@gmail.com>
 <20231222135048.1924672-2-npiggin@gmail.com>
 <20231222160414.5175ebba@p-imbrenda>
In-Reply-To: <20231222160414.5175ebba@p-imbrenda>
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
Cc: Laurent
 Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Janosch
 Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Dec 23, 2023 at 1:04 AM AEST, Claudio Imbrenda wrote:
> On Fri, 22 Dec 2023 23:50:40 +1000
> Nicholas Piggin <npiggin@gmail.com> wrote:
>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  s390x/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/s390x/Makefile b/s390x/Makefile
> > index f79fd009..95ef9533 100644
> > --- a/s390x/Makefile
> > +++ b/s390x/Makefile
> > @@ -227,7 +227,7 @@ $(snippet_asmlib): $$(patsubst %.o,%.S,$$@) $(asm-o=
ffsets)
> > =20
> > =20
> >  arch_clean: asm_offsets_clean
> > -	$(RM) $(TEST_DIR)/*.{o,elf,bin,lds} $(SNIPPET_DIR)/*/*.{o,elf,*bin,*o=
bj,hdr,lds} $(SNIPPET_DIR)/asm/.*.d $(TEST_DIR)/.*.d lib/s390x/.*.d $(comm-=
key)
> > +	$(RM) $(TEST_DIR)/*.{o,elf,bin,lds} $(SNIPPET_DIR)/*/*.{o,elf,*bin,*o=
bj,hdr,lds} $(SNIPPET_DIR)/asm/.*.d $(TEST_DIR)/.*.d lib/s390x/.*.d lib/aux=
info.o $(comm-key)
>
> it seems other architectures don't need to do the cleanp? what are we
> doing wrong?

x86 does clean it via cflatobjs. arm and powerpc never build the .o
AFAIKS.

Thanks,
Nick
