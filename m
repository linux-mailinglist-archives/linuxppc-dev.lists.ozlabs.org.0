Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998570FCBD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 19:33:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRJFQ0lHqz3fGt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 03:33:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.47; helo=mail-ej1-f47.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRJDx73DLz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 03:33:21 +1000 (AEST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-96f66fbd770so35032766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 10:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949597; x=1687541597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCSKoj+QaYMGiALxKIVygFGEfEGQMG7Gw+jdrUBXjYI=;
        b=JOu9NuybKq7BqQRW5gZq838R9J+Ox6evveqCC2cHbVRWTbaJNGY3+ePa6Dl4Ppbksd
         eXQanaxgbI80LkgDXfINQNAKBNah8vs46azzJpMM8c+r4VXBNEkneq62ZijLiY00Qi9L
         rlPpFqt8MxDrDrIAdyMZadIDqtbRD2Shg48utkW6BY34CxNjuHaTdBSZKXdqOXo+qzlG
         A75iiVrXDTZ+nyN9weDk3Af81+DGLu5587BKMkntRJydmCMFne8l1E+e959190PI79Ug
         Lyrwug+K3rvryLq6Rr+3S8sZd3Jafk/QXTAdpVwqvRI8xxxOGs5aZ+Fo0+RfDMpUuJoi
         trvw==
X-Gm-Message-State: AC+VfDyrig7M93mkamysOhh9ZIq8+GSd6TC5VPXzU9MrgDzfnvT2VMrJ
	tkrT0OmaDEobHPIeX65fmhj0fP+F790J1ANvquQ=
X-Google-Smtp-Source: ACHHUZ75t5LOoP5fPEw1B3B8AOZ5QAW3p/uA3PR3RjFQ63NrJQ3bU0l+qjgSiV2WQ1zsptMKJ1KiCOsk0UIwyQ0utjI=
X-Received: by 2002:a17:906:2218:b0:96f:4c38:4b1a with SMTP id
 s24-20020a170906221800b0096f4c384b1amr16403004ejs.5.1684949596574; Wed, 24
 May 2023 10:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230517131102.934196-1-arnd@kernel.org> <20230517131102.934196-11-arnd@kernel.org>
 <CAJZ5v0h0spuxK-7LBJSU9BK2TEOUeMjf7hhKScadkxFN_RwStQ@mail.gmail.com> <6b7f6f66-7890-47a3-a22d-e29f2944823a@app.fastmail.com>
In-Reply-To: <6b7f6f66-7890-47a3-a22d-e29f2944823a@app.fastmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 May 2023 19:33:05 +0200
Message-ID: <CAJZ5v0h+HNTMcfxFuOeO92D__NzJSTHfjzP5VQG4D+WuNmHpdw@mail.gmail.com>
Subject: Re: [PATCH 10/14] suspend: add a arch_resume_nosmt() prototype
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <epa
 ris@redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 17, 2023 at 4:52=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, May 17, 2023, at 15:48, Rafael J. Wysocki wrote:
> > On Wed, May 17, 2023 at 3:12=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> >>
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> The arch_resume_nosmt() has a __weak definition, plus an x86
> >> specific override, but no prototype that ensures the two have
> >> the same arguments. This causes a W=3D1 warning:
> >>
> >> arch/x86/power/hibernate.c:189:5: error: no previous prototype for 'ar=
ch_resume_nosmt' [-Werror=3Dmissing-prototypes]
> >>
> >> Add the prototype in linux/suspend.h, which is included in
> >> both places.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Do you want me to pick this up?
>
> Yes, please do. Thanks,

Done, thanks!
