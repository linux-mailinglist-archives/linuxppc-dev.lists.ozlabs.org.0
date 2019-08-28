Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9221C9FEE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 11:52:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JLcv407rzDr6K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 19:52:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fd5ytO3m"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JLZx2Rn1zDqtt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 19:50:33 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id y8so983359plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=paZOslhKnw8TpDSRRjRT/6S6+pm+zhq58hLrsqp6oq0=;
 b=fd5ytO3muKOvgMSw6HgGkDTUO7CEG/t2hHoPJ7x963boUxx7wBzwKyXc/F+5caWkF1
 6xY61bFhZaZhRlnxyqeasgEfoUqIKnqgDzbBewIVJBwB05cZJgOHu2mtgjzWfVkR+UhM
 8hiq4B6VjD0yMVAroD5H6bTdzmtS0i1dZrxE3l6kIRMdnUf6EsQAJR9sPt0v9gHf6Ocz
 bxOGZcDrJd7I3Fa9oIcRmi57ocreB/NLBu9pmXCxOPY7kjABrFsgUvTFFvxGYdXOzeLq
 AoCTo8bAfpnO/REZczISD6NipysGdC8VcnFMbK5HtB6LC3Pp86wVit5qHL1XVlMikavp
 VlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=paZOslhKnw8TpDSRRjRT/6S6+pm+zhq58hLrsqp6oq0=;
 b=LUTzJ585XRwcVr5x4k0Dvwrjp9laZPP5fGsNIPoNIEEwupQBkrb5NRjX8tTNmWDTL9
 gEkbgfUwuvVfYxYk07S7Y9tV2ZmUgwFnptrymqfWK+wpe8w/hsq2Nwocv0pUkxgfc45/
 re8BQMBcT7b1P6z9kcUjDEqJVVymf1pm26vxH86DyFW0XzR7/QgNIKxIjke0c1bIaOtc
 LBtisaMlfdVUD5JN7hCsDp+0hchDHccWcYEP9T///ayKdWv6MwylmrFQ7GVnBhegjFgk
 hIqoQf+U+PKuTQmqAPVa16/BS+DTfjebrEPoJ+Ymw81kaUU5CliCvRgoVD9ovzCNAola
 VTCw==
X-Gm-Message-State: APjAAAVi1qsHihsWGRWxfAYxJUJWbUIZUIdbkvMPyNKpti4K7vTADXHR
 590AicvgoHnG7OrwnJgL8CM=
X-Google-Smtp-Source: APXvYqzQv/ma85T1uHvLBCnXyHbfyAvj+NxRJp9F6fKjGZuDp5N0ojdZrwR8SjOday58YFhLrQkneg==
X-Received: by 2002:a17:902:465:: with SMTP id
 92mr3528226ple.128.1566985830529; 
 Wed, 28 Aug 2019 02:50:30 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id a142sm4712014pfd.147.2019.08.28.02.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 02:50:30 -0700 (PDT)
Date: Wed, 28 Aug 2019 19:49:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] powerpc/64: syscalls in C
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190827135548.21457-1-npiggin@gmail.com>
 <5ecd9d1a-d35e-dc8c-9ad4-a830a8b1a952@c-s.fr>
In-Reply-To: <5ecd9d1a-d35e-dc8c-9ad4-a830a8b1a952@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566985278.ehbnos9t6c.astroid@bobo.none>
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

Christophe Leroy's on August 28, 2019 7:06 pm:
>=20
>=20
> Le 27/08/2019 =C3=A0 15:55, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Accounted for some feedback.
>>=20
>> Nicholas Piggin (4):
>>    powerpc: convert to copy_thread_tls
>>    powerpc/64: remove support for kernel-mode syscalls
>>    powerpc/64: system call remove non-volatile GPR save optimisation
>>    powerpc/64: system call implement the bulk of the logic in C
>=20
> Would it be possible to split in the following parts:
>=20
> 1/ Implement in C whatever can be implemented without removing=20
> non-volatile GPR save optimisation
> 2/ Remove non-volatile GPR save optimisation
> 3/ Implement in C everything else

Hmm. I'll have a look but I would rather not go back and add the
intermediate state I was hoping to avoid. I'll think about it and
if it's not too difficult I will try to add something. I have an
idea.

With your nvregs performance test on ppc32, are you doing the
nvgpr restore? The fast path should be able to avoid that.

Thanks,
Nick
=
