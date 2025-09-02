Return-Path: <linuxppc-dev+bounces-11619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A645BB406FB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 16:34:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGSv32hHpz2xdg;
	Wed,  3 Sep 2025 00:34:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756823695;
	cv=none; b=T63yUnmjS0rEbp3Uu6lKlEb3l8uyySv5KMVuzkJKPRF1KRgjrmTTf8f/cXnMRGOiRP0xsqTK6tUZtmjwUKu2K6nEv7zqjLrvFcsYU4clcVC7xLiMADdIGbdpbZK2dJX1pfU4a0w7wnbEUL6GjCm6x6In0yfMNBX04pWvme78NFqoG9Ax/KmtMMRWhG1x4zl/FTPu9xBn6b4L6zj+Zi//+g3YXWNLwWMtl1eq0CRcskUVUCjvU5w5UJjrQj1VHmcyrtGUXalsJBKDOaIuPcSbtKui5zREcNl7u5o6NWDG4QwFadXjX4vu/t/S/D0If4DrffGeVux8XOJfvEJ0fIaSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756823695; c=relaxed/relaxed;
	bh=qzPM8+HwIDuV5edDNuZthm90SGDj75ruTnicPHqfRVk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=DREPAERhpEsb//2por0KFpteNesRbKfbg4gDzz9ExFhrp49wXoVV0MXKhVUvPpYQBdeOQ3TDkbYHy4/L9ib+xGtgY4t3jOFanioW8iDJw4FZTvfp+UYgTHIxIwY7iMG9UzrNTObeTnnqjNf30UYEdxjRk0Ecde0sFxYRxC3MfQIX++zk3Z86gSJC3DhLplj8q4uspxCTP9etW+BZsmO6dNKQIR7+f76TZr8kEYFxgmL8QYNjCDfGE1KXgPuKtsoffZwZdGwc465BQDL8+mW3l5I9R/VzOJgIxXx6XG6wujg4wem6JF4/7ROMfTsCy+HNcJ7kXwgo0UxAEaVFH5Tw9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=rrvUNW7y; dkim-atps=neutral; spf=pass (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=rrvUNW7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGSv02Mdrz2xnq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 00:34:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756823670; x=1757428470; i=markus.elfring@web.de;
	bh=qzPM8+HwIDuV5edDNuZthm90SGDj75ruTnicPHqfRVk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rrvUNW7yyAmtMB+LTVjtWQHGSHoSeXkIO/IX6drHiAL2QWkRCd596ifNMj92hMiR
	 irXzMW6MMc18QeV1KXfd1M8b387D5Yr38Enc9xRdcaQ9A/lIfCqgZd3HdN1UnvRun
	 josUD5l5IvkA7C2DTJoTih/7rylfiDMjDGX4FX0d2LP8IJa4KKM6eKY1W3jQEDUuu
	 1g/ZiCSMQarunp2vT9VtSEf3qb6fkfOgLYRaDEsdLW78XQzOx4IM7lFM6q2geK+hS
	 NRgGa6iMKWL/x765FL9HM1daabr3R1jgn7Peb/nC+VGw4Hiy8UE4Z9uZTuYmcyzKM
	 svA4ehlnu5TdHnNsmg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MKMA7-1vBPVx18Pf-00U426; Tue, 02
 Sep 2025 16:34:30 +0200
Message-ID: <d5f47a33-3f6d-4e18-be30-22019b84240d@web.de>
Date: Tue, 2 Sep 2025 16:34:28 +0200
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
User-Agent: Mozilla Thunderbird
To: Miaoqian Lin <linmq006@gmail.com>, linuxppc-dev@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Olof Johansson <olof@lixom.net>
References: <20250829063431.1968903-1-linmq006@gmail.com>
Subject: Re: [PATCH] powerpc/pasemi: Fix PCI device reference leak on error
 path
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250829063431.1968903-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YMwVr7kv96yWU1CgtqRin6wGUgzkm0ZCBCy9n7a/R75aRDxnij6
 IsooCxRXa14MSGM+dqFXBM5OLxxwjzVlJk9HzlBhK9hTirWh25QIzsl1aC90W5epoB0vcdM
 UkMu+g4PgJ7DI572XEaJMKdqOMVG76GxxBimhDGpHs4h/yCvrQQb0DJZm7lctIrScp8N0X6
 KB8kJuisXsT/tKubK7daA==
UI-OutboundReport: notjunk:1;M01:P0:J3oO1RgjZXs=;aHwpJiBRgSXycPSMEbKKKR3efEr
 CY4PoH0JCXSvkJmzwoicZcutxZaFBkbWmLt0HPIWkLCyNWyqlOIkWX2zgmDKQSxUyx1f8fTnC
 FU0P513b09d0ZlJf84w2i25ZnnQgcDWQDEBoaOa8Kdl10JrkcNBVugE1VscIVBrYBBPlBQu81
 uM3RmeiVhsKR04mCBdSB2p6KPGWBY+zDrsR9eJ7oClIM5o0iGIp+r0ZzCV231m/TBm8k0TzKh
 z9M9oirERBU4u8WDzOzfr5I+BzYczNPNU4Vq0QEs02iWkiB1K5LsQN7qJxgZIUxTW0eVe14OA
 BcbqrFd4/iAXRumi1dEV7q7U96fQssHIz+5dqUTjWsMhhDONmCOUFpzYuYgAfYwkSCCt7O1mM
 zEk/vXA4qE1c9O37IXhxe+qtseD6rE8UYHOu9PMD0QOoMrcYKDx8hJQOVqSIv/SVVznmP0kVy
 B+yTJoDIPVsl8i7uzb/uHtnyD2mI+4pRNZ3K32DO7Q0ep6gi9dyOEAo8qF7uf6upn/tmkCwUw
 E2zi6UK9I8IZQ5PiPS98bDdMuj9yushJ3GBO4ubzGc6hIgF4xq+BlKS6EYzxKFf77ELgPlPVi
 RUMQITL6y6ooUXg3PxK5pj+E/HU3vTjNIB5DG9+RkJeOTqfzfSNj6fvZDSO2kTwL3FmWQTPfL
 58gcN+I/n02iK2yG9UtZChdPaSXSeWiEcDXOir4WDi3UhOtD5CkZYYSr5nHrg92gMBP93vMyK
 O4epZK+PLkytNlka/8E+P8AyZHkcjN8D/bL04s+NODbavHibgeVIeF5CF7wXqQn5kMBwVpGP3
 QyOJUEJGuJAiD5nEEZzqvfw6UAxRnWtDUaG/HNtk4vUUQvMjndIDipfIQnCSBY+bCYrOuAqOJ
 UZ0dlZDBMnvB/oO4wUCaf9EtRg3YlbI71aeBy9VM7+nZxDPTFSpJX3DN3S74z8FN086A/hIE/
 6w05dRJpxlE89QhJOQtj35GfDUbbJiopmd58dTu9GIgQOk35WbeDwAJpeswL4X5mLQbbHU69R
 Q25ianB31voaXkaYTwfknDrMSQ/a6eTrlW3+XhscuGBo2WTvhFA0i0ivy6y3NXrDdVQASTYTw
 W53n/G2ykW33ydCj1jP7QPpYUyzwTYw2bwMZ8soWUfuw3LCouCo2PSkELpbiXwZKoDcIjjjZe
 DlyPtj97lHuwPTWz9Ne2V6m/FUr3KpvE/6IOu4N8zPPM15/GbsNU4dpoZJcSde3UGzDY3S3lC
 yKRuzhU3s49iEpz5Zpg4i8RDCme1orbOwzcwSrGZVsl8rbPk97+8aXnL2PUc0l+K1r3q8CKjt
 bBTBiwd4mREQTdvWwIapTM47BrXvivqJLqpLPoEjSfEvZ/9KowNH0RnZxrrLU76x98Z2n7lNJ
 Vst8H2nkEl61hOeI55C9pnei8c4EzTPcuQna2M2cZBNkI5zirUdapMar+dN9jR5AM/nbtVv9A
 UgPNmry3X932vxPZ9Fb3WrWs9Zoer/+9T0DZpkESz6ipZ6Npp9ErnbNGX9JCXVlC8BwZ3I3um
 cD9j8/jtxIofXm8XPyLeNF72CsT3rlg+OdSTF0ewe3ZkQbSkaLGOjdcxp+Xdi2YH+AN80HqH3
 cRwRpD1AfaavO/K/w43DKyNKz0of/2xiaE8IFn2HRsmUYiR+khuaoZgzBJQ+SDUU66PONfoUy
 VOcloNLDBl2+rUvgEfL/AcjivGlGjeVnmqVW0ttT6K3t6DYmhr6PF+h5uYIz1eLNM31ZK8g2U
 ykahBFPgtibuBb0fFaph+HHc8EhuRiuFxA25IMnXLbCNnV7ThVVsCdJ2oVfEkK/rM99IjOLIb
 4iJMZa7dvje2t/6MJecXz+09RfhoEU9QogP1yMFcVtN4weWG8GpHj9r6aYS7fWef8CYAQUHTi
 XTqNz9SRPmjTH4LPkKiTyTsHK7MGlFa+EDy5WVp60Dn/EKnAA1JWOBdpGjzmtDasz15q8YnNg
 G2h7jJySfFCyHH3tk/OzgZsgemsN8IAjjc34IUx05RO8pvMvvpYvALjfl6nTYhtxRY2X25nrb
 WNLmRbMzXnHOPYRDFYaJPWIxzFj42jM7tN9yABHGEvqQhPW8YYty5ugHygw5RIFPptWuw3S+A
 1Os7ZNQtozHRWRtj1iryoXcPEdRMO6Veu5vnuPsSQG32e+cGN2fKeXkue0bwMu5gZcP+5zh+W
 XzLRjV/ZoqsFgBcIFfTLDboeTa6qeeQ4qB3TQ182W5QvXahi14oVlgEnBrIK4dyv/9l7x9ZQr
 XjQl4nGgwbl288EYn7cLpZOsLbCWNr+G414JkLTRjVdlvV31DPRM0oxvhnduo0xgeo18ZwDTT
 gpijpbbNVLtCvVFulHge5NYMDCQZd+E6Yb7fPrXIyYmwttN145bdQcyqO++/N9i/DttW/RSqF
 qh85Re0XqKBRyxVYxoMPEZcpvBHisYUz68UN+tNH1OMJfS/JlMWq2kyUtnCnukgMa6zzsUDT1
 riETz/8TMY0xksqL+NbTcHyTEo841GLdz9vRvUr3vFtjCDaOllWgM7bMV15WmPOtXLk6LepJL
 n2c4eyabp2C2C4/IYWoR4//TLmJ/1Haq/Bg2EUviUqNhYZTrb19herT+qrrRzPmydU1sw3l01
 txJnQNZ0hexCrHni+a8dMoT5sJl7IwbV5y3U0mmih9qHg3rpdAa9oIHZzolWiVSDSOdJLYwn1
 D3ruBC67CmlS21GIFDLywXJq0BPnLRgHgEFhdCi4qQs/+ivTyvDSOLfGBmQP7ftJ50ff8nCsI
 Koi5uAfNzEdbIDNw4XundQlWDspr0PT9uk5PhX9SNE0Xv0+33S/n76nAG8Q7PN5iJIMCN3h03
 RJP6wOvIM4e8ip19NgQ0QRBvUcuCnn6+h+7wHsvxx/bPbmgEE6fUF6sUzQECdR1A6DvL5UK+4
 2uB/hSLUUNIjSb19u+m+tJdSrkJmtlJ0Hl3GeJbLcEOz9o0f8Tm6NGTp7xE2hG2YBIyut5Trx
 ruYJvqepomnOll/g9NO0StqQc8Cp/NUJGEL67wE6Uf/0KFLswci4CO/hTBUFBkU9D31GsxT+g
 CuRz4+cE1/lXw2zwvDVx6mIpCkm73u8LvD66R47uaXAaMWpzrcB1tmq+8onj794jFl9paYt7k
 HIqTwc66Pfk9F97ayM5ZTlqk7+FM59OPIX7Ei7Aj0RNAZygcGRZw3H8BkEveM3FWC699QQixX
 D1tLAkMueZlst7JQqzM8tPsyQ1gXL/7PjAxlkifbEGbV9NIh7onEwpDLOSMRqidSI0g+2bUwT
 fE30KH3j83kVon4dR/wUMuN1g7SEq49DZqrIGMRSmViYoAZ2NW6Qv9pngzwI/wgsA/UNZXF1E
 V3zCXaF+d6szd09B2kC3GAPvD34EWpGqFGA6adjsIhd9qhSHfhiqGFgYTYFFlf17kFdsVQ7Ow
 WDQYymgyiVOwPiiTH5eGge806CasO9Oxig7dih6jSiETIAIyuS1n3dZR024FxNUgMgL1rgnI0
 JmU9W+fQIZbMog4KfZuswGjpkxBivyajfa2uAt7PfG2K1LlanmI1UH139BUW/JjUn2+c4xjYQ
 PZ87LtJxY3ask+3+fRRjd0jDosGIc1aYLJGRUiPh3vM269CNCF2svybhyn4XCr3aHRK0kurS1
 yJ1Tp1bdL1rW2zbayUfhrIwWeL6tEBbubNPJ5yONaMo3LxAOjSP3igM0irE8PbANxuZsHhiv7
 AAxLIZnmXV0iqaDJAPgA2DFf2pMgmKJGdTZpLqb1n6drmHWZHd1S0uiH5ZuPFgsyRJnYL0BSF
 EtKeiUqESZd6EMAsY6BXPbR1tt86ZLse+pPmJPL7RRnzutfOqtfVDDjiX8omdFjZKh+WUPr1Y
 8FQhxQkzB0LKrvePO8gHLe0qsU1lRozt81UfIgYj9I3reqqky9AnNgbvEgS4WsibRS2n39sei
 tofsB6frAzMHtGLex8Cqys6ve/LSqFYWmWyLUkpCvGWic5Lg2hWNa8cjtun5YOYxcXfU5WQs8
 i6Y5/eUuHSwthpWPozEM+nirxl1coy1jps0ewmPI92aTxOv/QlX8j1tcAJBtv9D0WfoXcBw7Z
 /qyfrqvuLzYlTsJlQMCi+2a3SOT/54T0xqocZ3fhU1y1Htzx0NU2fSiCoGasjTP8XgfaUkuL3
 ZlFZy7rERUUSQnZSg2gSb0kNOyAEC8ddVyITnsrv/kwjRZfjwwv4YhAGLq6Zf+Jnek5Lyx+eA
 ezxQTWqpmjY8PWQXu5lL0CehrozZ0cudWpaSJ2hu2reQibnqcPeIczGkeC4I1NwflXgE7ghPw
 rRV/AfjYYEdIeToWC9EMBHLHJSm5jvqH+XhsjSPIW+Wn8nOM8tQnG70ZrzWYomjV7rbQiTrjt
 jOhsOoGAextWoYnJ5cb5pVQQo1/oSpsahn2Yr612Au19ncvpNzH2DcUtZ+WTXzjrh72Ny4kUW
 c5XgkB1rTkUBI8ykbkuEpvU360wGBjf7zJ88uL1LmhMcwraS+tDG/6Uefy8rFcNjJ1zLyOenE
 yUMHnO8BukAXTkPHWnUyw7d2mIXaOZYK82KtapW4lgy8r6gDOxsIxA9pltwCyRc7nMOSHB1Qf
 m7CaxAOEg4G2Yw2Kopx6e2E+OaTcygtycQB6q2fHgQnenQuIEQvmxrCkqpcNjZzJmn1YrG0BC
 WGM1E2fB7wiOmUdrtSHYpghbe8erPSuMhd09F3rM8T28xdATwQDNpmE18+jMYUpq9IFxi4yDy
 IZIxq+ahopQapea3juirGx2zJZnBD/YJ8jStUuHop4MuNBuwcVYLWZPHEmh75DsjxyrtBjP6I
 TZggPnznqqkCc4wUJrJWk+i0vbYnlyQ6WRxe6lXnTIu475dI4ABEqaH9eyU86w=
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Fix iob_pdev reference leak in pasemi_dma_init() when dma_pdev
> allocation fails. Ensure pci_dev_put(iob_pdev) is called on
> both success and error paths.

How do you think about to increase the application of scope-based resource=
 management?


=E2=80=A6
> +++ b/arch/powerpc/platforms/pasemi/dma_lib.c
> @@ -530,7 +530,7 @@ int pasemi_dma_init(void)
>  		BUG();
>  		pr_warn("Can't find DMA controller\n");
>  		err =3D -ENODEV;
> -		goto out;

Is it sufficient to add the function call =E2=80=9Cpci_dev_put(iob_pdev)=
=E2=80=9D
in this if branch?


> +		goto out_put_iob;
>  	}
>  	dma_regs =3D map_onedev(dma_pdev, 0);
=E2=80=A6

Regards,
Markus

