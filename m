Return-Path: <linuxppc-dev+bounces-15007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 911A1CDCA5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 16:16:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbwSY2hQDz2yRC;
	Thu, 25 Dec 2025 02:16:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766589373;
	cv=none; b=Wmvts5lC3ay4Xij1ndKv6Yc2IliRjDbtM1MTcU63KO9Np7SJNk1YaqCQ7rupphlSNL9LKlpw8uHv10T9ZD9PlZ3LH8mYJ9Bp28s6hTsiShTbtmALdgO/JhyDT8q9Ux/UnZEJ8w8o4Oy+VWwSrJFP4M7DlucLtjl6IwIJgoiW9OMqMKDCp4oZHH/bbW7Dk732upMs1eUBQIKpYtqRSPJ/b1vKgJxOs/fiem+KkWuNeAElVoQ/FzDVhI6RAD4coD6UOt+y5cussaSWWkhiIU8aMwXo7zaphQg1RwfofbekpkswzGov4H3/4QMYIw5u5RjpoTd4xarG3YTTKkKfifn2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766589373; c=relaxed/relaxed;
	bh=CycBEaw+g/cgJWbkk2PhM07iK10d4RJ2J4V6y6kRz3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCENEt7hJS8T+Eshtbh6wN9AffzfcAgrGlgbjzELl7Lg/pD797XYF+wbhBPXfMRxMKVDXTkoKjh5TomGN7b1xylKNk91EQ7khd8uCP6gpvqpCpiGmqjVNbpSISHW9XsAzpDWf+q4h+h41f4qRTP3+DfAKjfFjrvr3YoAPMjOCUANlOQ0VuW/c3olSoDh5NIT7xTN1Hio9xqy7hhocpuk5qkccp7SzCVSUnUKdTQ53m3VCmtry3mT5u8PkLyAxjEYTtNRp9cXDlB4N4LxS4ydTbhqHwvYz5VkznCc3RlCkvaP2hbQAh+HvCIHBV3+W3cxsTtg+7inuyzSaBrKjYduXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=M5PZ1W8t; dkim-atps=neutral; spf=pass (client-ip=209.85.167.54; helo=mail-lf1-f54.google.com; envelope-from=marco.crivellari@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=M5PZ1W8t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.167.54; helo=mail-lf1-f54.google.com; envelope-from=marco.crivellari@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbwSW3yN4z2yNv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Dec 2025 02:16:11 +1100 (AEDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-598efcf3a89so6032797e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 07:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766589307; x=1767194107; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CycBEaw+g/cgJWbkk2PhM07iK10d4RJ2J4V6y6kRz3A=;
        b=M5PZ1W8tDIMz7oNDcEuviJyiHV6++gLQlvCaeyf2s9VBe/gl9eTOufz3EWl4DB+AHF
         kjbo2yjTCOAly/1i83BZWRNIVFiguHJKjJDXZJDzY15w9Yz6KiVZLs94oevVmcAFMntI
         XGtAGmWMkcShGoCK/zs85bNiRSk+ITKxv0jpywg7h76bpVOOlVeEgg1djkKv6XnUC99E
         64l/FEKEUzram09pzQcrS5P9Xv/LRzhBJPXHfuHdOSSDrj247X2IA8wqYqZq+jfWqBVg
         UX4rMml2HeehLx007WTYILp/iaad2or+WMBM1W/9HHujhe1pOgt0iOD9nsA+qqXzlHFm
         HQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589307; x=1767194107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CycBEaw+g/cgJWbkk2PhM07iK10d4RJ2J4V6y6kRz3A=;
        b=gkL/ToDsXV6OWsxqQ4YXmqYRJwEqykYxRSrZwrdvKTtgI1cZ32j/4Sl+YWa7G0PD4/
         8a88M5eeMMJffN6HnbKqUKv1wvJOH1VAqYG2tEcsr+u+9A8xa4c9ur7GyXZpzMXvejDy
         xAEtYExROYLCxPI8qB3iw7bbAZh5ZG8K8R6GWJt/33Tqz6qS4gs+KUSKkquCIj2Ce0m8
         e8nitbYkFQW/UStrCkd4ffyoV2/8bJqgB+YB8wboRJ8TtqmjcN0YnYABgN/si5m5Ofby
         6wQWRsSHl4VXo+qgftqNq/127R+hB3CeRzlhEi1OL2/nkai45cXMdgrL0Yw9o+O6J/zA
         Aklg==
X-Forwarded-Encrypted: i=1; AJvYcCXi8oXMxs/+9lLMeLS6hDW1DKbu6D/RdIOcJiASvC1DcBsBjwLdmo/AoY5phzwPqCezDva4jtozzheYeMo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOkU5gRpfN5YdMBQ5XfTW7vae2h9qCgVV6nJXahS+GjfsZphpu
	0feO2ZB0QGy3+cjURLypdnhyROJ2X+9e7FtSnH1Z55IP7vvvdfQCY//4MDm0sik7Q+7JBN3pch2
	NRwyEKCd2Denbj8kLX/ybKZNLfjuFFxl143nVbpDOpQ==
X-Gm-Gg: AY/fxX5JhCBNPH1+3hyaZOl3dKZClp3ShU+NUSKNzohRUuYfeZxfgD9Uo6IEY0IvWAr
	/xY+KfzbgX9ThBVOtimY2tcbNlY+vy2+/spyhfGstX3iNVi8FE/qgVP+WTCPyQDAZBkaDZ92LWQ
	jNoWbiJGMz0tvCNZ6difcYSBcn/ipLG6m1LyVOiCmZxdZpgekS0+vUKRy3/aR4NL1aOz9IufG2I
	hPloojHvMgzbV/1Bdp0BzdO+SC0dLCzy4sfL6eohSB9CiX4JD8cERYK9F4dh7BbaAFAqxfqKhtn
	3afpYeZXk/SLHnmnnA+kE4OAJ4oRPE9BoMcWhjwQUcOxEKospw==
X-Google-Smtp-Source: AGHT+IG5doQ1AoM607tW6NsnGv1eeFmuWxpyUXAogngdumreggtFnGADJc34A7ALOET4J+lArW6e7KSNKfEXkw5zH0k=
X-Received: by 2002:a05:6512:2304:b0:594:cb92:b377 with SMTP id
 2adb3069b0e04-59a17dea461mr6709412e87.42.1766589307288; Wed, 24 Dec 2025
 07:15:07 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251107143335.242342-1-marco.crivellari@suse.com>
In-Reply-To: <20251107143335.242342-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 16:14:56 +0100
X-Gm-Features: AQt7F2oLWWcUyBViQcoQGcfXMQVcKlSndHpfyMlDE84FGBNAbRZ8IuvKSmFMtPw
Message-ID: <CAAofZF4M_iAbYssdkfoZb8XGXQVxOzQqGPrW-nTaknUWdCiz=Q@mail.gmail.com>
Subject: Re: [PATCH] PCI: pnv_php: add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 7, 2025 at 3:33=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> ---
>  drivers/pci/hotplug/pnv_php.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.=
c
> index c5345bff9a55..35f1758126c6 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -802,7 +802,7 @@ static struct pnv_php_slot *pnv_php_alloc_slot(struct=
 device_node *dn)
>         }
>
>         /* Allocate workqueue for this slot's interrupt handling */
> -       php_slot->wq =3D alloc_workqueue("pciehp-%s", 0, 0, php_slot->nam=
e);
> +       php_slot->wq =3D alloc_workqueue("pciehp-%s", WQ_PERCPU, 0, php_s=
lot->name);
>         if (!php_slot->wq) {
>                 SLOT_WARN(php_slot, "Cannot alloc workqueue\n");
>                 kfree(php_slot->name);

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

