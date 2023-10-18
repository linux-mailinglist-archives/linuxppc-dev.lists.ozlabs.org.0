Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 878547CD64E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 10:22:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hL33o6uO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OcmJOuCU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9P3K3FPpz3cFw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 19:22:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hL33o6uO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OcmJOuCU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9P2N41Glz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 19:21:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697617287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxyLuX2sVSgocSVP1OJP8CY85CjyrBJH2u1BiNoMcK0=;
	b=hL33o6uO6baWiTPaZWH4W2hsapanK8stFUUtDN2vUtbhqcbyN4r44Hd7wv0o9F1QpniBi7
	mGWp1x3gwVWUw7HcpsIyfmWsCFfuLK4u49m2l/k45R/4sUn4Db8r7I5zbSlQWVx+lfKadx
	aPxeif1zLmSoqGSmjbFbVkWxf8s4eKU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697617288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxyLuX2sVSgocSVP1OJP8CY85CjyrBJH2u1BiNoMcK0=;
	b=OcmJOuCU+CUy04z5hNUaQibCk4VOYQAmeUxNMYbUnFxJMR0yOu41PHAaADLnSb+LV5asqd
	LL8qwPFT2Ch8XXXMt/pfutKm6ZY09qzn5nnHYud9D3DZ5mwV0bPMLReKNIPR+unShUjBmR
	0I6RPxzQvA4nEIFO1WvqTPIiKTTn5lg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-9zvBav_xM1K6zHuCkqwWnA-1; Wed, 18 Oct 2023 04:21:20 -0400
X-MC-Unique: 9zvBav_xM1K6zHuCkqwWnA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-778915a0c73so83368285a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 01:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697617280; x=1698222080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxyLuX2sVSgocSVP1OJP8CY85CjyrBJH2u1BiNoMcK0=;
        b=K29JXucfL7dceK1BZRYrpMqJHAQKnaZarf6QEC0NHLnOEJR3jMoShr5bOA3ftPdh2H
         spftutnsQSzMV4qjBnkAlVjZLMjzdhpiWEF/3VA3uK1FaYklJzXf0/QK1WrHJBsVtZ1S
         m+6MQmCBWQ638JLu2ujTCZRPuK0nHDYn4QmqWFfjz/75DrMXfbaOQ6EPoF/LsQsXUF2D
         ++rWI4eFJ7IyyEOpHgpPp4PgsZxhjDkTqpPCEXiXM+kr27/DoG9cMF9wITjnxRtq45Pu
         n3Wiy1NLvKE05Qc3NJKnbtMthD2WGYnrDRDq+772g6oVDTbRWtBuEhKCqObzNM4Ev6Kh
         sXTw==
X-Gm-Message-State: AOJu0YxS7rXHSno+lejdFJttEsADW0R3AGUM1Zpq1Z8qGBzJ3VFacNju
	P7OwA9NBT9HFFwCSrR+tNtGeC95pEABZ+cbtIAhOkD6aWVYCI/xc0BlIeAH2haakHqMUmOec02v
	nlZdp11dOvA34lKhQrZ5pAkB0I2IHy+mknlBF8A0Zpw==
X-Received: by 2002:a05:6214:b6a:b0:65d:afc:3a52 with SMTP id ey10-20020a0562140b6a00b0065d0afc3a52mr5765337qvb.49.1697617280073;
        Wed, 18 Oct 2023 01:21:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHEzDiqR89ZioUu+FBLZxahmm1G/0JaYQSHoQo8mqvVERP6h3/yg3Ccnp1+KCRgp7ZOTHk4yr+FE4y1NMHClA=
X-Received: by 2002:a05:6214:b6a:b0:65d:afc:3a52 with SMTP id
 ey10-20020a0562140b6a00b0065d0afc3a52mr5765320qvb.49.1697617279800; Wed, 18
 Oct 2023 01:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231017022806.4523-1-piliu@redhat.com> <20231017022806.4523-3-piliu@redhat.com>
 <064ae2ee-ad15-c0ab-f78b-7b3e7dc6612d@linux.ibm.com>
In-Reply-To: <064ae2ee-ad15-c0ab-f78b-7b3e7dc6612d@linux.ibm.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Wed, 18 Oct 2023 16:21:08 +0800
Message-ID: <CAF+s44S33-x=bjZsLc=Ke+J6UFPq6DMxPA1Vaohc6_qLoEw9iw@mail.gmail.com>
Subject: Re: [PATCHv9 2/2] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
To: Hari Bathini <hbathini@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 17, 2023 at 6:39=E2=80=AFPM Hari Bathini <hbathini@linux.ibm.co=
m> wrote:
>
>
>
> On 17/10/23 7:58 am, Pingfan Liu wrote:
> > *** Idea ***
> > For kexec -p, the boot cpu can be not the cpu0, this causes the problem
> > of allocating memory for paca_ptrs[]. However, in theory, there is no
> > requirement to assign cpu's logical id as its present sequence in the
> > device tree. But there is something like cpu_first_thread_sibling(),
> > which makes assumption on the mapping inside a core. Hence partially
> > loosening the mapping, i.e. unbind the mapping of core while keep the
> > mapping inside a core.
> >
> > *** Implement ***
> > At this early stage, there are plenty of memory to utilize. Hence, this
> > patch allocates interim memory to link the cpu info on a list, then
> > reorder cpus by changing the list head. As a result, there is a rotate
> > shift between the sequence number in dt and the cpu logical number.
> >
> > *** Result ***
> > After this patch, a boot-cpu's logical id will always be mapped into th=
e
> > range [0,threads_per_core).
> >
> > Besides this, at this phase, all threads in the boot core are forced to
> > be onlined. This restriction will be lifted in a later patch with
> > extra effort.
> >
> > Signed-off-by: Pingfan Liu <piliu@redhat.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > Cc: Wen Xiong <wenxiong@us.ibm.com>
> > Cc: Baoquan He <bhe@redhat.com>
> > Cc: Ming Lei <ming.lei@redhat.com>
> > Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> > Cc: Hari Bathini <hbathini@linux.ibm.com>
> > Cc: kexec@lists.infradead.org
> > To: linuxppc-dev@lists.ozlabs.org
>
> Thanks for working on this, Pingfan.
> Looks good to me.
>
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
>

Thank you for kindly reviewing. I hope that after all these years, we
have accomplished the objective.

Best Regards,

Pingfan

