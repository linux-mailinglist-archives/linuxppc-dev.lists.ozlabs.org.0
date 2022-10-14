Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 817445FF070
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 16:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpprG2fJSz3gNx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:37:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=relay.hostedemail.com (client-ip=216.40.44.14; helo=relay.hostedemail.com; envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MppLv5Mskz3ffy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 01:15:17 +1100 (AEDT)
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id B3E9D4099E;
	Fri, 14 Oct 2022 14:15:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 06F541C;
	Fri, 14 Oct 2022 14:14:56 +0000 (UTC)
Message-ID: <043b9474f83b2da34bce5ff94b9aa3b735b70d4f.camel@perches.com>
Subject: Re: [PATCH AUTOSEL 4.9 1/3] powerpc/selftests: Use timersub() for
 gettimeofday()
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Fri, 14 Oct 2022 07:15:08 -0700
In-Reply-To: <20221014135502.2110218-1-sashal@kernel.org>
References: <20221014135502.2110218-1-sashal@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Stat-Signature: 3zgjaw88zojn6q9khoy8omazrsq4orrh
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 06F541C
X-Spam-Status: No, score=-0.31
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX190Yuwm6bfJNyNHFDdGFIA6O0pYyJESv1I=
X-HE-Tag: 1665756896-52267
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
Cc: ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-10-14 at 09:54 -0400, Sasha Levin wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> [ Upstream commit c814bf958926ff45a9c1e899bd001006ab6cfbae ]
>=20
> Use timersub() function to simplify the code.

Why should a code simplification be backported?

>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://lore.kernel.org/r/20220816105106.82666-1-ye.xingchen@zte.co=
m.cn
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/testing/selftests/powerpc/benchmarks/gettimeofday.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/testing/selftests/powerpc/benchmarks/gettimeofday.c b/=
tools/testing/selftests/powerpc/benchmarks/gettimeofday.c
> index 3af3c21e8036..7f4bb84f1c9c 100644
> --- a/tools/testing/selftests/powerpc/benchmarks/gettimeofday.c
> +++ b/tools/testing/selftests/powerpc/benchmarks/gettimeofday.c
> @@ -12,7 +12,7 @@ static int test_gettimeofday(void)
>  {
>  	int i;
> =20
> -	struct timeval tv_start, tv_end;
> +	struct timeval tv_start, tv_end, tv_diff;
> =20
>  	gettimeofday(&tv_start, NULL);
> =20
> @@ -20,7 +20,9 @@ static int test_gettimeofday(void)
>  		gettimeofday(&tv_end, NULL);
>  	}
> =20
> -	printf("time =3D %.6f\n", tv_end.tv_sec - tv_start.tv_sec + (tv_end.tv_=
usec - tv_start.tv_usec) * 1e-6);
> +	timersub(&tv_start, &tv_end, &tv_diff);
> +
> +	printf("time =3D %.6f\n", tv_diff.tv_sec + (tv_diff.tv_usec) * 1e-6);
> =20
>  	return 0;
>  }

