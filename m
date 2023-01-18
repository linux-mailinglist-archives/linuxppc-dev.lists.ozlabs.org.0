Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6767107E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 03:02:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxTXT59gxz3c6l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 13:02:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k9nZqbAy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k9nZqbAy;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxTWb1Tfbz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 13:01:14 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4b6255ce5baso448467917b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 18:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4E07Mrlokbjok8NyF8LoBrAZNQWCs1UWN04ZvvsKt1E=;
        b=k9nZqbAy6zimnKuDQP5Wi59ksf9yl4aqdPitA84ns9UlmkktReAp9H08OJzyEbCc9J
         jlDJGMFtUt+DQUFCjpFjACsoOm7c2T8Ko3BIWmNfotQIa4DTLkedyccK3mJJ5Ty52tU7
         Pjqt7Q630XACChklgKzdcQGHFItj196tBjXccVmZpdBJCyn6CNLYisPTgri5QyuUVR+7
         dmUvvZbw8Qidf7u0joBcNRjhlVUuqFpoLv2ThdeXP2UpNCfOLsBXBlqXHkBQXH0g/JiS
         Ag8FlCGONB7nFbeNMrZ59yFKtUHJpRow7tNRX5eRbp7wzA9oeEkB6FFhJC81J/OTedMt
         9Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4E07Mrlokbjok8NyF8LoBrAZNQWCs1UWN04ZvvsKt1E=;
        b=3nSYuE7r1G00WiXXaI683EcsnSn8mk48+aNqGz8PzGxPHdGQpS+96qzyOD1lyb01dQ
         yBFkAPiea3/77pfLPmzKz1BhjAZPP7+aUvnXfEBTYNIcJ+JXT7qgPmU+qfwpxa1HaLkI
         EgkOmVQtQi3yDlAZUT4MeYf+XxgXSUo5FW42b/1hnhkceE9ZgWfmtjyMtf3HKPMFglXs
         qF2zILekaIGbEicOTlsWyvrXfkc9qX9Jd0dW6E6bwkX+RLyk96lIYZtfRO9MrJUShl+4
         0/OkDwtQ/d2RgqC1WI8zWitMTKHbvrAxaVhCBe7CoePZYp9kl7O+oOmEweQx/cYNq4cQ
         p1ig==
X-Gm-Message-State: AFqh2krousi0b1zA8DpKCbivgXGXYTxIvm0zccFPw073WY7VN14aRcv3
	+Xz3OIakShnrlIaZATSZVfQlqlfgFkEhHEZaGaGW8Q==
X-Google-Smtp-Source: AMrXdXsZWeD7TD1LZKXqm18TxRLwIraaKkRGisl2ohrjniYmFM7Qtmaw6wJy/oQcDtGLbtaO2lGyLeazDPZnc+XZmGs=
X-Received: by 2002:a81:1d2:0:b0:433:f1c0:3f1c with SMTP id
 201-20020a8101d2000000b00433f1c03f1cmr704506ywb.438.1674007272153; Tue, 17
 Jan 2023 18:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-18-surenb@google.com>
 <Y8a734ufLZjPHgtT@dhcp22.suse.cz>
In-Reply-To: <Y8a734ufLZjPHgtT@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 18:01:01 -0800
Message-ID: <CAJuCfpGoYaF2-z7FCiN4X8gEGD6nAwnQC+=n3tUHuMWZa7zx8Q@mail.gmail.com>
Subject: Re: [PATCH 17/41] mm/mmap: move VMA locking before
 anon_vma_lock_write call
To: Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 7:16 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 09-01-23 12:53:12, Suren Baghdasaryan wrote:
> > Move VMA flag modification (which now implies VMA locking) before
> > anon_vma_lock_write to match the locking order of page fault handler.
>
> Does this changelog assumes per vma locking in the #PF?

Hmm, you are right. Page fault handlers do not use per-vma locks yet
but the changelog already talks about that. Maybe I should change it
to simply:
```
Move VMA flag modification (which now implies VMA locking) before
vma_adjust_trans_huge() to ensure the modifications are done after VMA
has been locked.
```
Is that better?

>
> --
> Michal Hocko
> SUSE Labs
