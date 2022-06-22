Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A76554A59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 14:53:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSjx62zHrz3cg3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 22:53:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kaod.org (client-ip=205.139.111.44; helo=us-smtp-delivery-44.mimecast.com; envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 70 seconds by postgrey-1.36 at boromir; Wed, 22 Jun 2022 22:53:05 AEST
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSjwd5WBVz3blq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 22:53:03 +1000 (AEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-bMR0t5tvPzC-aze2xY3N8g-1; Wed, 22 Jun 2022 08:51:45 -0400
X-MC-Unique: bMR0t5tvPzC-aze2xY3N8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E3AF85A585;
	Wed, 22 Jun 2022 12:51:45 +0000 (UTC)
Received: from bahia (unknown [10.39.192.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5237E1131D;
	Wed, 22 Jun 2022 12:51:43 +0000 (UTC)
Date: Wed, 22 Jun 2022 14:51:42 +0200
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] KVM: PPC: Book3s: Fix warning about
 xics_rm_h_xirr_x
Message-ID: <20220622145142.53c3668f@bahia>
In-Reply-To: <20220622055235.1139204-1-aik@ozlabs.ru>
References: <20220622055235.1139204-1-aik@ozlabs.ru>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Jun 2022 15:52:35 +1000
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> This fixes "no previous prototype":
>=20
> arch/powerpc/kvm/book3s_hv_rm_xics.c:482:15:
> warning: no previous prototype for 'xics_rm_h_xirr_x' [-Wmissing-prototyp=
es]
>=20
> Reported by the kernel test robot.
>=20
> Fixes: b22af9041927 ("KVM: PPC: Book3s: Remove real mode interrupt contro=
ller hcalls handlers")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

FWIW

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/kvm/book3s_xics.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/powerpc/kvm/book3s_xics.h b/arch/powerpc/kvm/book3s_xic=
s.h
> index 8e4c79e2fcd8..08fb0843faf5 100644
> --- a/arch/powerpc/kvm/book3s_xics.h
> +++ b/arch/powerpc/kvm/book3s_xics.h
> @@ -143,6 +143,7 @@ static inline struct kvmppc_ics *kvmppc_xics_find_ics=
(struct kvmppc_xics *xics,
>  }
> =20
>  extern unsigned long xics_rm_h_xirr(struct kvm_vcpu *vcpu);
> +extern unsigned long xics_rm_h_xirr_x(struct kvm_vcpu *vcpu);
>  extern int xics_rm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
>  =09=09=09 unsigned long mfrr);
>  extern int xics_rm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr);

